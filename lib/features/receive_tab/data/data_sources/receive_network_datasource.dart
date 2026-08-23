import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:local_send/features/receive_tab/data/models/handshake_response_model.dart';
import 'package:local_send/features/receive_tab/data/models/receive_request_model.dart';

abstract interface class ReceiveNetworkDatasource {
  /// Start the ServerSocket on a specific port.
  Future<void> startServer(int port);

  /// Stop the server and close all open connections.
  Future<void> stopServer();

  /// Check if the server is currently running.
  bool get isServerRunning;

  /// Get local IP addresses for active network interfaces (Wi-Fi / Ethernet).
  Future<List<String>> getLocalIpAddresses();

  /// Stream that emits new incoming transfer requests from senders.
  Stream<ReceiveRequestModel> get incomingRequestsStream;

  /// Send accept or reject decision back to the sender for this sessionId.
  Future<bool> sendHandshakeResponse({
    required String sessionId,
    required HandshakeResponseModel response,
  });

  /// Stream of raw incoming byte chunks for a specific session.
  Stream<List<int>> getIncomingBytesStream(String sessionId);

  /// Close connection and free resources for a specific session.
  Future<void> closeSessionConnection(String sessionId);

  /// Stream that emits sessionId when a sender suddenly disconnects.
  Stream<String> get onSessionDisconnectedStream;
}

@LazySingleton(as: ReceiveNetworkDatasource)
class ReceiveNetworkDatasourceImpl implements ReceiveNetworkDatasource {
  static const int _maxHandshakeSize = 64 * 1024;
  static const Duration _handshakeTimeout = Duration(seconds: 10);

  ServerSocket? _serverSocket;

  StreamController<ReceiveRequestModel> _incomingRequestsController =
      StreamController<ReceiveRequestModel>.broadcast();

  final Map<String, Socket> _activeSockets = {};

  final Map<String, StreamController<List<int>>> _bytesControllers = {};

  StreamController<String> _disconnectedSessionsController =
      StreamController<String>.broadcast();

  @override
  Future<void> startServer(int port) async {
    try {
      await stopServer();

      if (_incomingRequestsController.isClosed) {
        _incomingRequestsController =
            StreamController<ReceiveRequestModel>.broadcast();
      }
      if (_disconnectedSessionsController.isClosed) {
        _disconnectedSessionsController = StreamController<String>.broadcast();
      }

      _serverSocket = await ServerSocket.bind(InternetAddress.anyIPv4, port);

      _serverSocket!.listen(
        (Socket clientSoket) {
          _handleIncomingConnection(clientSoket);
        },
        onError: (error) {
          log('ServerSocket error: $error');
        },
      );
    } catch (exception) {
      log(exception.toString());
      rethrow;
    }
  }

  @override
  bool get isServerRunning => _serverSocket != null;

  @override
  Future<List<String>> getLocalIpAddresses() async {
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
      );

      return interfaces
          .expand((interface) => interface.addresses)
          .where(
            (addr) => !addr.isLoopback && addr.type == InternetAddressType.IPv4,
          )
          .map((address) => address.address)
          .toList();
    } catch (exception) {
      log(exception.toString());
      return [];
    }
  }

  @override
  Stream<ReceiveRequestModel> get incomingRequestsStream {
    return _incomingRequestsController.stream;
  }

  @override
  Future<bool> sendHandshakeResponse({
    required String sessionId,
    required HandshakeResponseModel response,
  }) async {
    final Socket? socket = _activeSockets[sessionId];

    if (socket == null) return false;

    try {
      final String jsonString = jsonEncode(response.toMap());
      final Uint8List jsonBytes = utf8.encode(jsonString);

      final ByteData lengthData = ByteData(4)
        ..setUint32(0, jsonBytes.length, Endian.big);
      final Uint8List headerBytes = lengthData.buffer.asUint8List();

      socket.add(headerBytes);
      socket.add(jsonBytes);

      await socket.flush();

      if (response.decision != HandshakeDecision.accepted) {
        await closeSessionConnection(sessionId);
      }

      return true;
    } catch (exception) {
      log('Failed to send handshake response: $exception');
      await closeSessionConnection(sessionId);
      return false;
    }
  }

  @override
  Stream<List<int>> getIncomingBytesStream(String sessionId) {
    return _bytesControllers
        .putIfAbsent(sessionId, () => StreamController<List<int>>.broadcast())
        .stream;
  }

  @override
  Stream<String> get onSessionDisconnectedStream {
    return _disconnectedSessionsController.stream;
  }

  @override
  Future<void> closeSessionConnection(String sessionId) async {
    final socket = _activeSockets.remove(sessionId);
    if (socket != null) {
      try {
        await socket.flush();
        await socket.close();
      } catch (exception) {
        socket.destroy();
        log("Error when closing session connection: $exception");
      }
    }

    final bytesController = _bytesControllers.remove(sessionId);
    if (bytesController != null && !bytesController.isClosed) {
      await bytesController.close();
    }
  }

  @override
  Future<void> stopServer() async {
    try {
      for (final String sessionId in _activeSockets.keys.toList()) {
        await closeSessionConnection(sessionId);
      }
      _activeSockets.clear();
      _bytesControllers.clear();

      await _serverSocket?.close();
      _serverSocket = null;

      if (!_incomingRequestsController.isClosed) {
        await _incomingRequestsController.close();
      }
      if (!_disconnectedSessionsController.isClosed) {
        await _disconnectedSessionsController.close();
      }
    } catch (exception) {
      log(exception.toString());
    }
  }

  void _handleIncomingConnection(Socket socket) {
    final BytesBuilder buffer = BytesBuilder();
    int? expectedLength;
    bool isHandshakeDone = false;
    String? currentSessionId;

    late final StreamSubscription<Uint8List> subscription;

    final Timer handshakeTimer = Timer(_handshakeTimeout, () {
      if (!isHandshakeDone) {
        log('Handshake timed out for incoming connection');
        socket.destroy();
      }
    });

    subscription = socket.listen(
      (Uint8List chunks) {
        buffer.add(chunks);

        while (!isHandshakeDone) {
          if (expectedLength == null) {
            if (buffer.length < 4) break;

            final Uint8List allCurrentBytes = buffer.takeBytes();
            final ByteData byteData = ByteData.sublistView(allCurrentBytes);

            // Read first 4 bytes as an integer
            expectedLength = byteData.getUint32(0, Endian.big);

            if (expectedLength! > _maxHandshakeSize) {
              log(
                'Handshake length exceeds max allowable size: $expectedLength',
              );
              handshakeTimer.cancel();
              socket.destroy();
              return;
            }

            if (allCurrentBytes.length > 4) {
              buffer.add(allCurrentBytes.sublist(4));
            }
          }

          if (expectedLength != null) {
            if (buffer.length < expectedLength!) break;

            final Uint8List allBytes = buffer.takeBytes();
            final Uint8List jsonBytes = allBytes.sublist(0, expectedLength);
            final String jsonString = utf8.decode(jsonBytes);
            final jsonMap = jsonDecode(jsonString);

            final requestModel = ReceiveRequestModel.fromMap(jsonMap);
            currentSessionId = requestModel.sessionId;

            // Save socket in Map by sessionId
            _activeSockets[requestModel.sessionId] = socket;

            _bytesControllers[currentSessionId!] = StreamController<List<int>>(
              onListen: () {
                if (subscription.isPaused) subscription.resume();
              },
              onPause: () {
                if (!subscription.isPaused) subscription.pause();
              },
              onResume: () {
                if (subscription.isPaused) subscription.resume();
              },
              onCancel: () {
                if (!subscription.isPaused) subscription.pause();
              },
            );

            handshakeTimer.cancel();
            isHandshakeDone = true;

            // Send model to Stream controller
            _incomingRequestsController.add(requestModel);

            if (allBytes.length > expectedLength!) {
              buffer.add(allBytes.sublist(expectedLength!));
            }

            isHandshakeDone = true;
            expectedLength = null;
          }
        }

        if (isHandshakeDone && buffer.isNotEmpty && currentSessionId != null) {
          final Uint8List rawFileBytes = buffer.takeBytes();
          _bytesControllers[currentSessionId]?.add(rawFileBytes);
        }
      },
      onError: (error) {
        _handleSessionDisconnection(currentSessionId, socket);
      },
      onDone: () {
        _handleSessionDisconnection(currentSessionId, socket);
      },
      cancelOnError: false,
    );
  }

  void _handleSessionDisconnection(String? sessionId, Socket socket) {
    if (sessionId != null) {
      if (_activeSockets.containsKey(sessionId)) {
        _disconnectedSessionsController.add(sessionId);
      }
      closeSessionConnection(sessionId);
    } else {
      socket.destroy();
    }
  }
}

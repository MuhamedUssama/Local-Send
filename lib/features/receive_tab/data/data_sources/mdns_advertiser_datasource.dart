import 'dart:async';
import 'dart:developer';

import 'package:bonsoir/bonsoir.dart';
import 'package:injectable/injectable.dart';

abstract interface class MdnsAdvertiserDatasource {
  /// Register and broadcast the service on the local network.
  /// [serviceType] Service type (e.g. _localsend._tcp)
  /// [serviceName] Device name visible to others (e.g. Mohamed's MacBook)
  /// [port] Port number used by the server to receive connections
  /// [attributes] Extra info stored in TXT record (e.g. deviceModel, deviceType, version)
  Future<void> registerService({
    required String serviceType,
    required String serviceName,
    required int port,
    Map<String, String>? attributes,
  });

  /// Stop broadcasting and unregister the service from the network.
  Future<void> unregisterService();

  /// Check if the service is currently advertising.
  bool get isAdvertising;

  /// Update TXT record attributes while advertising without restarting the service.
  /// Note: This causes a brief visibility gap on the network during re-registration.
  Future<void> updateServiceAttributes(Map<String, String> newAttributes);

  /// Stream to listen for broadcast errors or connection drops from the OS.
  Stream<String> get onAdvertisingErrorStream;
}

@LazySingleton(as: MdnsAdvertiserDatasource)
class MdnsAdvertiserDatasourceImpl implements MdnsAdvertiserDatasource {
  BonsoirBroadcast? _broadcast;
  BonsoirService? _service;
  StreamSubscription<BonsoirBroadcastEvent>? _broadcastSubscription;
  Future<void>? _pendingOperation;

  final StreamController<String> _onAdvertisingErrorStream =
      StreamController<String>.broadcast();

  bool _isBroadcasting = false;

  @override
  Future<void> registerService({
    required String serviceType,
    required String serviceName,
    required int port,
    Map<String, String>? attributes,
  }) async {
    while (_pendingOperation != null) {
      await _pendingOperation;
    }

    final Completer<void> completer = Completer<void>();
    _pendingOperation = completer.future;

    try {
      if (serviceName.trim().isEmpty) {
        throw ArgumentError('Service name cannot be empty');
      }

      await _cleanupBroadcastResources();

      _service = BonsoirService(
        name: serviceName,
        type: serviceType,
        port: port,
        attributes: attributes ?? {},
      );

      _broadcast = BonsoirBroadcast(service: _service!);
      await _broadcast!.initialize();

      final Stream<BonsoirBroadcastEvent>? stream = _broadcast!.eventStream;
      if (stream == null) {
        throw StateError('Bonsoir eventStream is null after initialization');
      }

      _broadcastSubscription = stream.listen(
        (event) {
          switch (event) {
            case BonsoirBroadcastStartedEvent():
              _isBroadcasting = true;
              log('mDNS service broadcast started: ${_service?.name}');
            case BonsoirBroadcastStoppedEvent():
              _isBroadcasting = false;
              log('mDNS service broadcast stopped');
            default:
              log('mDNS broadcast event: $event');
          }
        },
        onError: (error) {
          log('mDNS broadcast error: $error');
          _isBroadcasting = false;
          _onAdvertisingErrorStream.add(error.toString());
        },
      );

      await _broadcast!.start();
    } catch (exception) {
      log('Failed to register mDNS service: $exception');
      _isBroadcasting = false;
      await _cleanupBroadcastResources();
      rethrow;
    } finally {
      completer.complete();
      _pendingOperation = null;
    }
  }

  @override
  Future<void> unregisterService() async {
    while (_pendingOperation != null) {
      await _pendingOperation;
    }

    final Completer<void> completer = Completer<void>();
    _pendingOperation = completer.future;

    try {
      await _cleanupBroadcastResources();
    } catch (exception) {
      log("Cannot un register service: $exception");
    } finally {
      completer.complete();
      _pendingOperation = null;
    }
  }

  Future<void> _cleanupBroadcastResources() async {
    try {
      await _broadcastSubscription?.cancel();
      _broadcastSubscription = null;

      await _broadcast?.stop();
      _broadcast = null;
      _service = null;
      _isBroadcasting = false;
    } catch (exception) {
      log('Error during mDNS cleanup: $exception');
    }
  }

  @override
  bool get isAdvertising => _isBroadcasting;

  @override
  Future<void> updateServiceAttributes(Map<String, String> attributes) async {
    if (_service == null || !_isBroadcasting) return;

    await registerService(
      serviceType: _service!.type,
      serviceName: _service!.name,
      port: _service!.port,
      attributes: attributes,
    );
  }

  @override
  Stream<String> get onAdvertisingErrorStream =>
      _onAdvertisingErrorStream.stream;

  @disposeMethod
  Future<void> dispose() async {
    await unregisterService();
    if (!_onAdvertisingErrorStream.isClosed) {
      await _onAdvertisingErrorStream.close();
    }
  }
}

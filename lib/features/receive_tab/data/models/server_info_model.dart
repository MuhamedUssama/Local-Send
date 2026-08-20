enum ServerStatus { stopped, starting, running, error }

class ServerInfoModel {
  final String deviceName;
  final String deviceId;
  final List<String> ipAddresses;
  final int port;
  final ServerStatus status;
  final String? networkName; // SSID للـ Wi-Fi لو متاح
  final String? errorMessage;

  const ServerInfoModel({
    required this.deviceName,
    required this.deviceId,
    required this.ipAddresses,
    required this.port,
    required this.status,
    this.networkName,
    this.errorMessage,
  });

  ServerInfoModel copyWith({
    String? deviceName,
    String? deviceId,
    List<String>? ipAddresses,
    int? port,
    ServerStatus? status,
    String? networkName,
    String? errorMessage,
  }) {
    return ServerInfoModel(
      deviceName: deviceName ?? this.deviceName,
      deviceId: deviceId ?? this.deviceId,
      ipAddresses: ipAddresses ?? this.ipAddresses,
      port: port ?? this.port,
      status: status ?? this.status,
      networkName: networkName ?? this.networkName,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

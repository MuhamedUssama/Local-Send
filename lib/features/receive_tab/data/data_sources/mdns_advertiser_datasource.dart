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
  Future<void> updateServiceAttributes(Map<String, String> newAttributes);

  /// Stream to listen for broadcast errors or connection drops from the OS.
  Stream<String> get onAdvertisingErrorStream;
}

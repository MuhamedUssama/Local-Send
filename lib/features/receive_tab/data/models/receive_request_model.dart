enum DevicePlatformType { android, ios, windows, macos, linux, unknown }

class ReceiveRequestModel {
  final String sessionId;
  final String senderDeviceId;
  final String senderDeviceName;
  final DevicePlatformType senderPlatform;
  final String senderIp;
  final int senderPort;
  final List<TransferFileInfoModel> files;
  final int totalBytes;
  final DateTime requestedAt;

  const ReceiveRequestModel({
    required this.sessionId,
    required this.senderDeviceId,
    required this.senderDeviceName,
    required this.senderPlatform,
    required this.senderIp,
    required this.senderPort,
    required this.files,
    required this.totalBytes,
    required this.requestedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'sessionId': sessionId,
      'senderDeviceId': senderDeviceId,
      'senderDeviceName': senderDeviceName,
      'senderPlatform': senderPlatform.name,
      'senderIp': senderIp,
      'senderPort': senderPort,
      'files': files.map((file) => file.toMap()).toList(),
      'totalBytes': totalBytes,
      'requestedAt': requestedAt.toIso8601String(),
    };
  }

  factory ReceiveRequestModel.fromMap(Map<String, dynamic> map) {
    final rawPlatform = map['senderPlatform'] as String? ?? 'unknown';
    return ReceiveRequestModel(
      sessionId: map['sessionId'] as String,
      senderDeviceId: map['senderDeviceId'] as String,
      senderDeviceName: map['senderDeviceName'] as String,
      senderPlatform: DevicePlatformType.values.firstWhere(
        (p) => p.name == rawPlatform,
        orElse: () => DevicePlatformType.unknown,
      ),
      senderIp: map['senderIp'] as String,
      senderPort: (map['senderPort'] as num).toInt(),
      files: (map['files'] as List<dynamic>)
          .map(
            (item) =>
                TransferFileInfoModel.fromMap(item as Map<String, dynamic>),
          )
          .toList(),
      totalBytes: (map['totalBytes'] as num).toInt(),
      requestedAt: DateTime.parse(map['requestedAt'] as String),
    );
  }
}

class TransferFileInfoModel {
  final String id;
  final String fileName;
  final int fileSizeBytes;
  final String fileExtension;
  final String? mimeType;

  const TransferFileInfoModel({
    required this.id,
    required this.fileName,
    required this.fileSizeBytes,
    required this.fileExtension,
    this.mimeType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fileName': fileName,
      'fileSizeBytes': fileSizeBytes,
      'fileExtension': fileExtension,
      'mimeType': mimeType,
    };
  }

  factory TransferFileInfoModel.fromMap(Map<String, dynamic> map) {
    return TransferFileInfoModel(
      id: map['id'] as String,
      fileName: map['fileName'] as String,
      fileSizeBytes: (map['fileSizeBytes'] as num).toInt(),
      fileExtension: map['fileExtension'] as String,
      mimeType: map['mimeType'] as String?,
    );
  }
}

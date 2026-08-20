enum TransferStatus { idle, transferring, paused, completed, failed, cancelled }

class TransferProgressModel {
  final String sessionId;
  final String currentFileId;
  final String currentFileName;
  final int currentFileIndex;
  final int totalFilesCount;
  final int bytesReceivedForCurrentFile;
  final int totalBytesForCurrentFile;
  final int totalBytesReceivedSoFar;
  final int overallTotalBytes;
  // Current transfer speed in bytes per second
  final double speedBytesPerSecond;
  final TransferStatus status;
  final String? failureReason;

  const TransferProgressModel({
    required this.sessionId,
    required this.currentFileId,
    required this.currentFileName,
    required this.currentFileIndex,
    required this.totalFilesCount,
    required this.bytesReceivedForCurrentFile,
    required this.totalBytesForCurrentFile,
    required this.totalBytesReceivedSoFar,
    required this.overallTotalBytes,
    required this.speedBytesPerSecond,
    required this.status,
    this.failureReason,
  });

  /// Current file progress percentage (0.0 to 1.0)
  double get currentFileProgress => totalBytesForCurrentFile == 0
      ? 0.0
      : (bytesReceivedForCurrentFile / totalBytesForCurrentFile).clamp(
          0.0,
          1.0,
        );

  /// Overall progress percentage for all files (0.0 to 1.0)
  double get overallProgress => overallTotalBytes == 0
      ? 0.0
      : (totalBytesReceivedSoFar / overallTotalBytes).clamp(0.0, 1.0);

  /// Current transfer speed formatted in MB/s
  double get speedInMegaBytesPerSecond => speedBytesPerSecond / (1024 * 1024);

  /// Estimated remaining time in seconds
  int get estimatedRemainingSeconds {
    if (speedBytesPerSecond <= 0) return 0;
    final remainingBytes = overallTotalBytes - totalBytesReceivedSoFar;
    return (remainingBytes / speedBytesPerSecond).ceil();
  }
}

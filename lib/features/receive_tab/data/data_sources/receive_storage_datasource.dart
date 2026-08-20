abstract interface class ReceiveStorageDatasource {
  /// Check if there is enough storage space on disk before starting download.
  Future<bool> hasEnoughStorageSpace({
    required int requiredBytes,
    required String targetDirectoryPath,
  });

  /// Create file and open sink to start writing incoming chunks.
  /// [targetDirectoryPath] Target folder path (e.g. Downloads folder)
  /// [fileName] Name of the file to save
  /// Returns the final full path of the saved file on disk.
  Future<String> initializeFileSink({
    required String sessionId,
    required String fileId,
    required String fileName,
    required String targetDirectoryPath,
  });

  /// Write a chunk of bytes directly to the open file for this session.
  Future<void> writeChunk({
    required String sessionId,
    required String fileId,
    required List<int> bytes,
  });

  /// Flush remaining data and close the sink after transfer finishes.
  Future<void> finalizeFile({
    required String sessionId,
    required String fileId,
  });

  /// Delete incomplete file from disk if transfer is cancelled or failed.
  Future<void> deleteIncompleteFile({required String filePath});

  /// Generate a unique file name to avoid overwriting existing files (e.g. file (1).png).
  Future<String> resolveUniqueFileName({
    required String fileName,
    required String targetDirectoryPath,
  });

  /// Close all open file sinks and clean up resources for a session.
  Future<void> releaseSessionResources(String sessionId);
}

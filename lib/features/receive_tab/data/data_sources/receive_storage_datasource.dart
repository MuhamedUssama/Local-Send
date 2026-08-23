import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:storage_utility/storage_utility.dart';
import 'package:path/path.dart' as p;

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

@LazySingleton(as: ReceiveStorageDatasource)
class ReceiveStorageDatasourceImpl implements ReceiveStorageDatasource {
  final Map<String, IOSink> _activeSinks = {};
  final Map<String, String> _activeFilePaths = {};
  final Map<String, Object> _sinkErrors = {};

  @override
  Future<bool> hasEnoughStorageSpace({
    required int requiredBytes,
    required String targetDirectoryPath,
  }) async {
    try {
      int freeBytesDefault = await getFreeBytes(path: targetDirectoryPath);
      return (freeBytesDefault > (requiredBytes + (100 * 1024 * 1024)));
    } catch (exception) {
      log('Failed to check free disk space: $exception');
      return true;
    }
  }

  String _getSinkKey(String sessionId, String fileId) => '$sessionId-$fileId';

  @override
  Future<String> initializeFileSink({
    required String sessionId,
    required String fileId,
    required String fileName,
    required String targetDirectoryPath,
  }) async {
    final Directory directory = await Directory(
      targetDirectoryPath,
    ).create(recursive: true);

    final String uniqueFileName = await resolveUniqueFileName(
      fileName: fileName,
      targetDirectoryPath: directory.path,
    );

    final String fullFilePath = p.join(directory.path, uniqueFileName);

    final IOSink sink = File(fullFilePath).openWrite(mode: FileMode.writeOnly);

    final String sinkKey = _getSinkKey(sessionId, fileId);

    sink.done.catchError((error) {
      log('Disk write error on sink $sinkKey: $error');
      _sinkErrors[sinkKey] = error;
    });

    _activeSinks[sinkKey] = sink;
    _activeFilePaths[sinkKey] = fullFilePath;

    return fullFilePath;
  }

  @override
  Future<void> writeChunk({
    required String sessionId,
    required String fileId,
    required List<int> bytes,
  }) async {
    final String sinkKey = _getSinkKey(sessionId, fileId);

    if (_sinkErrors.containsKey(sinkKey)) {
      throw FileSystemException(
        'Failed to write chunk due to earlier disk error: ${_sinkErrors[sinkKey]}',
      );
    }

    final IOSink? sink = _activeSinks[sinkKey];

    if (sink == null) {
      log('No active sink found for key $sinkKey');
      throw StateError(
        'Cannot write chunk: No active sink for session $sessionId and file $fileId',
      );
    }

    sink.add(bytes);
  }

  @override
  Future<void> finalizeFile({
    required String sessionId,
    required String fileId,
  }) async {
    final String sinkKey = _getSinkKey(sessionId, fileId);
    final IOSink? sink = _activeSinks.remove(sinkKey);
    _activeFilePaths.remove(sinkKey);
    final diskError = _sinkErrors.remove(sinkKey);

    if (sink == null) {
      throw StateError('Cannot finalize file: No active sink for key $sinkKey');
    }

    if (diskError != null) {
      await sink.close();
      throw FileSystemException('File transfer failed on disk: $diskError');
    }

    await sink.flush();
    await sink.close();
    await sink.done;
  }

  @override
  Future<void> deleteIncompleteFile({required String filePath}) async {
    final file = File(filePath);
    if (await file.exists()) await file.delete();
  }

  @override
  Future<String> resolveUniqueFileName({
    required String fileName,
    required String targetDirectoryPath,
  }) async {
    final String extension = p.extension(fileName);
    final String baseName = p.basenameWithoutExtension(fileName);

    int counter = 0;

    while (true) {
      final String newFileName = counter == 0
          ? '$baseName$extension'
          : '$baseName ($counter)$extension';

      final String filePath = p.join(targetDirectoryPath, newFileName);
      final File file = File(filePath);

      if (!await file.exists()) {
        return newFileName;
      }

      counter++;
    }
  }

  @override
  Future<void> releaseSessionResources(String sessionId) async {
    final String prefix = '$sessionId-';

    final List<String> sessionKeys = _activeSinks.keys
        .where((key) => key.startsWith(prefix))
        .toList();

    for (String key in sessionKeys) {
      final IOSink? sink = _activeSinks.remove(key);

      if (sink != null) {
        try {
          await sink.flush();
          await sink.close();
        } catch (e) {
          log('Error closing sink $key: $e');
        }
      }

      final String? incompletePath = _activeFilePaths.remove(key);
      if (incompletePath != null) {
        await deleteIncompleteFile(filePath: incompletePath);
      }
    }
  }
}

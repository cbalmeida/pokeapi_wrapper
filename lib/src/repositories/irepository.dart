import 'dart:typed_data';

import '../core.dart';

abstract class IRepository {
  Future<Either<Error, String?>> get(String url);

  Future<int> clearCache(Function(String key, int progress) onProgress);

  Future<int> get cacheSize;

  Future<Either<Error, Uint8List>> getContent(String url);
}

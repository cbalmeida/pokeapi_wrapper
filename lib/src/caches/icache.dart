abstract class ICache {
  Future<String?> getFromLocalStorage(String url);

  Future<bool> putToLocalStorage(String url, String value);

  Future<int> clearCache(Function(String key, int progress) onProgress);

  Future<int> get cacheSize;
}

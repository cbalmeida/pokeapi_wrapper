import 'package:shared_preferences/shared_preferences.dart';

import 'icache.dart';

class CacheSharedPrefs implements ICache {
  SharedPreferences? _sharedPreferences;
  Future<SharedPreferences> _getSharedPreferences() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  Future<List<String>> get _cacheKeys async {
    return (await _getSharedPreferences()).getKeys().where((element) => element.startsWith('http')).toList();
  }

  @override
  Future<String?> getFromLocalStorage(String url) async {
    final String? value = (await _getSharedPreferences()).getString(url);
    return value;
  }

  @override
  Future<bool> putToLocalStorage(String url, String value) async {
    await (await _getSharedPreferences()).setString(url, value);
    return true;
  }

  @override
  Future<int> clearCache(Function(String key, int progress) onProgress) async {
    int sizeTotal = 0;
    List<String> keys = await _cacheKeys;
    for (int i = 0; i < keys.length; i++) {
      String key = keys.elementAt(i);
      sizeTotal += (await _getSharedPreferences()).getString(key)?.length ?? 0;
      await (await _getSharedPreferences()).remove(key);
      onProgress(key, (i + 1) * 100 ~/ keys.length);
    }
    return sizeTotal;
  }

  @override
  Future<int> get cacheSize async {
    int sizeTotal = 0;
    List<String> keys = await _cacheKeys;
    for (int i = 0; i < keys.length; i++) {
      String key = keys.elementAt(i);
      sizeTotal += (await _getSharedPreferences()).getString(key)?.length ?? 0;
    }
    return sizeTotal;
  }
}

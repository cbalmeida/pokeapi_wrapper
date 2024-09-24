import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'icache.dart';

class CacheHive implements ICache {
  Box<String>? _box;

  Future<Directory> get _dirApplicationDocumentsDirectory async {
    try {
      return await getApplicationDocumentsDirectory();
    } catch (e) {
      return Directory("./applicationDocuments");
    }
  }

  Future<Directory> get _dirHivedb async {
    return Directory("${(await _dirApplicationDocumentsDirectory).path}/hivedb");
  }

  Future<Box<String>> _getBox() async {
    if (_box == null) {
      String path = (await _dirHivedb).path;
      Directory dir = Directory(path);
      dir.createSync(recursive: true);
      Hive.init(dir.path);
      _box = await Hive.openBox('cache');
    }
    return _box!;
  }

  Future<List<String>> get _cacheKeys async {
    final box = await _getBox();
    final List<String> result = [];
    for (var key in box.keys) {
      if (key.startsWith('http')) {
        result.add(key);
      }
    }
    return result;
  }

  @override
  Future<String?> getFromLocalStorage(String url) async {
    final box = await _getBox();
    final String? value = box.get(url);
    return value;
  }

  @override
  Future<bool> putToLocalStorage(String url, String value) async {
    final box = await _getBox();
    await box.put(url, value);
    return true;
  }

  @override
  Future<int> clearCache(Function(String key, int progress) onProgress) async {
    final box = await _getBox();
    int sizeTotal = 0;
    List<String> keys = await _cacheKeys;
    for (int i = 0; i < keys.length; i++) {
      String key = keys.elementAt(i);
      sizeTotal += box.get(key)?.length ?? 0;
      await box.delete(key);
      onProgress(key, (i + 1) * 100 ~/ keys.length);
    }
    return sizeTotal;
  }

  @override
  Future<int> get cacheSize async {
    final box = await _getBox();
    int sizeTotal = 0;
    for (var key in box.keys) {
      sizeTotal += box.get(key)?.length ?? 0;
    }
    return sizeTotal;
  }
}

import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../pokeapi_wrapper.dart';
import '../caches.dart';
import '../repositories.dart';

class Repository implements IRepository {
  final ICache cache;

  Repository(this.cache);

  @override
  Future<Either<Error, String?>> get(String url) async {
    String? localStorageValue = await cache.getFromLocalStorage(url);
    if (localStorageValue != null) {
      return Right(localStorageValue);
    }

    Either<Error, String?> apiStorageValue = await _getFromApi(url);
    if (apiStorageValue.isRight) {
      String? value = apiStorageValue.right;
      if (value != null) {
        await cache.putToLocalStorage(url, value);
      }
      return Right(value);
    }
    return apiStorageValue;
  }

  /*
  Future<List<String>> get _cacheKeys async {
    return (await _getSharedPreferences()).getKeys().where((element) => element.startsWith('http')).toList();
  }
   */

  @override
  Future<int> clearCache(Function(String key, int progress) onProgress) async {
    return cache.clearCache(onProgress);
  }

  @override
  Future<int> get cacheSize async {
    return cache.cacheSize;
  }

  /*
  /// local storage

  SharedPreferences? _sharedPreferences;
  Future<SharedPreferences> _getSharedPreferences() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  Future<String?> _getFromLocalStorage(String url) async {
    final String? value = (await _getSharedPreferences()).getString(url);
    return value;
  }

  Future<bool> _putToLocalStorage(String url, String value) async {
    await (await _getSharedPreferences()).setString(url, value);
    return true;
  }

   */

  /// api

  Future<Either<Error, String?>> _getFromApi(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print("_getFromApi OK ($url)");
        return Right(response.body);
      } else {
        // print("_getFromApi Error ($url) => ${response.statusCode} - ${response.body}");
        return Left(StateError(response.body));
      }
    } catch (e) {
      // print("_getFromApi Error ($url) => ${e.toString()}");
      return Left(StateError(e.toString()));
    }
  }

  @override
  Future<Either<Error, Uint8List>> getContent(String url) async {
    try {
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      //final String? value = prefs.getString(url);
      final String? value = await cache.getFromLocalStorage(url);

      if (value != null) return Right(Uint8List.fromList(value.codeUnits));
      var response = await http.get(Uri.parse(url));
      Uint8List bytes = response.bodyBytes;
      final String downloadContent = String.fromCharCodes(bytes);

      //await prefs.setString(url, downloadContent);
      await cache.putToLocalStorage(url, downloadContent);

      return Right(bytes);
    } catch (e) {
      return Left(StateError(e.toString()));
    }
  }
}

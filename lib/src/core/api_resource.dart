import 'package:flutter/cupertino.dart';

import 'mapper.dart';

@immutable
abstract class ApiResource {
  final String url;

  const ApiResource({
    required this.url,
  });

  // static var mapper = ApiResourceMapper();
}

abstract class ApiResourceMapper<T extends ApiResource> extends Mapper<T> {
  T fromUrl(String url);

  @override
  T fromMap(Map<String, dynamic>? map) {
    return fromUrl(map?['url'] ?? '');
  }

  @override
  Map<String, dynamic> toMap(T value) {
    return {
      'url': value.url,
    };
  }
}

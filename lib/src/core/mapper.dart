import 'dart:convert';

import 'package:flutter/cupertino.dart';

@immutable
abstract class Mapper<T> {
  const Mapper();

  T fromMap(Map<String, dynamic>? map);

  Map<String, dynamic> toMap(T value);

  List<T> fromList(List<dynamic>? list) {
    return list?.map<T>((e) => fromMap(e)).toList() ?? [];
  }

  List<Map<String, dynamic>> toList(List<T>? list) {
    return list?.map<Map<String, dynamic>>((e) => toMap(e)).toList() ?? [];
  }

  T fromJson(String? json) {
    try {
      Map<String, dynamic> map = jsonDecode(json ?? '{}');
      return fromMap(map);
    } catch (e) {
      throw StateError("Mapper.fromJson: ${json ?? '{}'} - $e");
    }
  }

  String toJson(T value) {
    return jsonEncode(toMap(value));
  }
}

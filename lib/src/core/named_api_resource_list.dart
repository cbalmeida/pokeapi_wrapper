import 'package:flutter/cupertino.dart';

import '../../pokeapi_wrapper.dart';

@immutable
class NamedApiResourceList {
  static var mapper = NamedApiResourceListMapper();

  /// The total number of resources available from this API.
  final int count;

  /// The URL for the next page in the list.
  final String next;

  /// The URL for the previous page in the list.
  final String previous;

  /// A list of named API resources.
  final List<dynamic> results;

  const NamedApiResourceList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}

class NamedApiResourceListMapper extends Mapper<NamedApiResourceList> {
  @override
  NamedApiResourceList fromMap(Map<String, dynamic>? map) {
    return NamedApiResourceList(
      count: map?['count'] ?? 0,
      next: map?['next'] ?? '',
      previous: map?['previous'] ?? '',
      results: map?['results'] ?? [],
    );
  }

  @override
  Map<String, dynamic> toMap(NamedApiResourceList value) {
    return {
      'count': value.count,
      'next': value.next,
      'previous': value.previous,
      'results': value.results,
    };
  }
}

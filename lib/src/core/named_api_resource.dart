import '../core.dart';

class NamedApiResource extends ApiResource {
  final String name;

  const NamedApiResource({
    required this.name,
    required super.url,
  });

  static var mapper = NamedApiResourceMapper();
}

class NamedApiResourceMapper extends Mapper<NamedApiResource> {
  @override
  NamedApiResource fromMap(Map<String, dynamic>? map) {
    return NamedApiResource(
      name: map?['name'] ?? '',
      url: map?['url'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap(NamedApiResource value) {
    return {
      'name': value.name,
      'url': value.url,
    };
  }
}

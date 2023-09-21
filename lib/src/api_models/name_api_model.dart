import '../../pokeapi_wrapper.dart';

class NameApiModel extends ApiModel {
  static var mapper = NameApiModelMapper();

  final String name;

  final LanguageApiResource language;

  const NameApiModel({
    required this.name,
    required this.language,
  });
}

class NameApiModelMapper extends Mapper<NameApiModel> {
  @override
  NameApiModel fromMap(Map<String, dynamic>? map) {
    return NameApiModel(
      name: map?['name'] ?? '',
      language: LanguageApiResource.mapper.fromMap(map?['language']),
    );
  }

  @override
  Map<String, dynamic> toMap(NameApiModel value) {
    return {
      'name': value.name,
      'language': LanguageApiResource.mapper.toMap(value.language),
    };
  }
}

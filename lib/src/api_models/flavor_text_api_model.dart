import '../../pokeapi_wrapper.dart';

class FlavorTextApiModel extends ApiModel {
  static var mapper = FlavorTextApiModelMapper();

  final String flavorText;

  final LanguageApiResource language;

  final VersionApiResource version;

  const FlavorTextApiModel({
    required this.flavorText,
    required this.language,
    required this.version,
  });
}

class FlavorTextApiModelMapper extends Mapper<FlavorTextApiModel> {
  @override
  FlavorTextApiModel fromMap(Map<String, dynamic>? map) {
    return FlavorTextApiModel(
      flavorText: map?['flavor_text'] ?? '',
      language: LanguageApiResource.mapper.fromMap(map?['language']),
      version: VersionApiResource.mapper.fromMap(map?['version']),
    );
  }

  @override
  Map<String, dynamic> toMap(FlavorTextApiModel value) {
    return {
      'flavor_text': value.flavorText,
      'language': LanguageApiResource.mapper.toMap(value.language),
      'version': VersionApiResource.mapper.toMap(value.version),
    };
  }
}

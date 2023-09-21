import '../../pokeapi_wrapper.dart';

class AbilityFlavorTextApiModel extends ApiModel {
  static var mapper = AbilityFlavorTextApiModelMapper();

  final String flavorText;

  final LanguageApiResource language;

  final VersionGroupApiResource versionGroup;

  const AbilityFlavorTextApiModel({
    required this.flavorText,
    required this.language,
    required this.versionGroup,
  });
}

class AbilityFlavorTextApiModelMapper extends Mapper<AbilityFlavorTextApiModel> {
  @override
  AbilityFlavorTextApiModel fromMap(Map<String, dynamic>? map) {
    return AbilityFlavorTextApiModel(
      flavorText: map?['flavor_text'] ?? '',
      language: LanguageApiResource.mapper.fromMap(map?['language']),
      versionGroup: VersionGroupApiResource.mapper.fromMap(map?['version_group']),
    );
  }

  @override
  Map<String, dynamic> toMap(AbilityFlavorTextApiModel value) {
    return {
      'flavor_text': value.flavorText,
      'language': LanguageApiResource.mapper.toMap(value.language),
      'version_group': VersionGroupApiResource.mapper.toMap(value.versionGroup),
    };
  }
}

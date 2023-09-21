import '../../pokeapi_wrapper.dart';

class MoveFlavorTextApiModel extends ApiModel {
  static var mapper = MoveFlavorTextApiModelMapper();

  final String flavorText;

  final LanguageApiResource language;

  final VersionGroupApiResource versionGroup;

  const MoveFlavorTextApiModel({
    required this.flavorText,
    required this.language,
    required this.versionGroup,
  });
}

class MoveFlavorTextApiModelMapper extends Mapper<MoveFlavorTextApiModel> {
  @override
  MoveFlavorTextApiModel fromMap(Map<String, dynamic>? map) {
    return MoveFlavorTextApiModel(
      flavorText: map?['flavor_text'] ?? '',
      language: LanguageApiResource.mapper.fromMap(map?['language']),
      versionGroup: VersionGroupApiResource.mapper.fromMap(map?['version_group']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveFlavorTextApiModel value) {
    return {
      'flavor_text': value.flavorText,
      'language': LanguageApiResource.mapper.toMap(value.language),
      'version_group': VersionGroupApiResource.mapper.toMap(value.versionGroup),
    };
  }
}

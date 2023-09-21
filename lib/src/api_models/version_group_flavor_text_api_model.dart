import '../../pokeapi_wrapper.dart';

class VersionGroupFlavorTextApiModel extends ApiModel {
  static var mapper = VersionGroupFlavorTextApiModelMapper();

  final String text;

  final LanguageApiResource language;

  final VersionGroupApiResource versionGroup;

  const VersionGroupFlavorTextApiModel({
    required this.text,
    required this.language,
    required this.versionGroup,
  });
}

class VersionGroupFlavorTextApiModelMapper extends Mapper<VersionGroupFlavorTextApiModel> {
  @override
  VersionGroupFlavorTextApiModel fromMap(Map<String, dynamic>? map) {
    return VersionGroupFlavorTextApiModel(
      text: map?['text'] ?? '',
      language: LanguageApiResource.mapper.fromMap(map?['language']),
      versionGroup: VersionGroupApiResource.mapper.fromMap(map?['version_group']),
    );
  }

  @override
  Map<String, dynamic> toMap(VersionGroupFlavorTextApiModel value) {
    return {
      'text': value.text,
      'language': LanguageApiResource.mapper.toMap(value.language),
      'version_group': VersionGroupApiResource.mapper.toMap(value.versionGroup),
    };
  }
}

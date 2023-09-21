import '../../pokeapi_wrapper.dart';

class DescriptionApiModel extends ApiModel {
  static var mapper = DescriptionApiModelMapper();

  final String description;

  final LanguageApiResource language;

  const DescriptionApiModel({
    required this.description,
    required this.language,
  });
}

class DescriptionApiModelMapper extends Mapper<DescriptionApiModel> {
  @override
  DescriptionApiModel fromMap(Map<String, dynamic>? map) {
    return DescriptionApiModel(
      description: map?['description'] ?? '',
      language: LanguageApiResource.mapper.fromMap(map?['language']),
    );
  }

  @override
  Map<String, dynamic> toMap(DescriptionApiModel value) {
    return {
      'description': value.description,
      'language': LanguageApiResource.mapper.toMap(value.language),
    };
  }
}

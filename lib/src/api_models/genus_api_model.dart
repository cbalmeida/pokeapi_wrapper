import '../../pokeapi_wrapper.dart';

class GenusApiModel extends ApiModel {
  static var mapper = GenusApiModelMapper();

  final String genus;

  final LanguageApiResource language;

  const GenusApiModel({
    required this.genus,
    required this.language,
  });
}

class GenusApiModelMapper extends Mapper<GenusApiModel> {
  @override
  GenusApiModel fromMap(Map<String, dynamic>? map) {
    return GenusApiModel(
      genus: map?['genus'] ?? '',
      language: LanguageApiResource.mapper.fromMap(map?['language']),
    );
  }

  @override
  Map<String, dynamic> toMap(GenusApiModel value) {
    return {
      'genus': value.genus,
      'language': LanguageApiResource.mapper.toMap(value.language),
    };
  }
}

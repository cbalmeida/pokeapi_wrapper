import '../../pokeapi_wrapper.dart';

class ContestNameApiModel extends ApiModel {
  static var mapper = ContestNameApiModelMapper();

  final String name;

  final String color;

  final LanguageApiResource language;

  const ContestNameApiModel({
    required this.name,
    required this.color,
    required this.language,
  });
}

class ContestNameApiModelMapper extends Mapper<ContestNameApiModel> {
  @override
  ContestNameApiModel fromMap(Map<String, dynamic>? map) {
    return ContestNameApiModel(
      name: map?['name'] ?? '',
      color: map?['color'] ?? '',
      language: LanguageApiResource.mapper.fromMap(map?['language']),
    );
  }

  @override
  Map<String, dynamic> toMap(ContestNameApiModel value) {
    return {
      'name': value.name,
      'color': value.color,
      'language': LanguageApiResource.mapper.toMap(value.language),
    };
  }
}

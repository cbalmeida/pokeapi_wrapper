import '../../pokeapi_wrapper.dart';

class AwesomeNameApiModel extends ApiModel {
  static var mapper = AwesomeNameApiModelMapper();

  final String awesomeName;

  final LanguageApiResource language;

  const AwesomeNameApiModel({
    required this.awesomeName,
    required this.language,
  });
}

class AwesomeNameApiModelMapper extends Mapper<AwesomeNameApiModel> {
  @override
  AwesomeNameApiModel fromMap(Map<String, dynamic>? map) {
    return AwesomeNameApiModel(
      awesomeName: map?['awesome_name'],
      language: LanguageApiResource.mapper.fromMap(map?['language']),
    );
  }

  @override
  Map<String, dynamic> toMap(AwesomeNameApiModel value) {
    return {
      'awesome_name': value.awesomeName,
      'language': LanguageApiResource.mapper.toMap(value.language),
    };
  }
}

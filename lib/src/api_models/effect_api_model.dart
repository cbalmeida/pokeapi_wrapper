import '../../pokeapi_wrapper.dart';

class EffectApiModel extends ApiModel {
  static var mapper = EffectApiModelMapper();

  final String effect;

  final LanguageApiResource language;

  const EffectApiModel({
    required this.effect,
    required this.language,
  });
}

class EffectApiModelMapper extends Mapper<EffectApiModel> {
  @override
  EffectApiModel fromMap(Map<String, dynamic>? map) {
    return EffectApiModel(
      effect: map?['effect'] ?? '',
      language: LanguageApiResource.mapper.fromMap(map?['language']),
    );
  }

  @override
  Map<String, dynamic> toMap(EffectApiModel value) {
    return {
      'effect': value.effect,
      'language': LanguageApiResource.mapper.toMap(value.language),
    };
  }
}

import '../../pokeapi_wrapper.dart';

class VerboseEffectApiModel extends ApiModel {
  static var mapper = VerboseEffectApiModelMapper();

  final String effect;

  final String shortEffect;

  final LanguageApiResource language;

  const VerboseEffectApiModel({
    required this.effect,
    required this.shortEffect,
    required this.language,
  });
}

class VerboseEffectApiModelMapper extends Mapper<VerboseEffectApiModel> {
  @override
  VerboseEffectApiModel fromMap(Map<String, dynamic>? map) {
    return VerboseEffectApiModel(
      effect: map?['effect'] ?? '',
      shortEffect: map?['shortEffect'] ?? '',
      language: LanguageApiResource.mapper.fromMap(map?['language']),
    );
  }

  @override
  Map<String, dynamic> toMap(VerboseEffectApiModel value) {
    return {
      'effect': value.effect,
      'shortEffect': value.shortEffect,
      'language': LanguageApiResource.mapper.toMap(value.language),
    };
  }
}

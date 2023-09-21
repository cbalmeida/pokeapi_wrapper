import '../core.dart';

class PokemonFormSpritesApiModel extends ApiModel {
  static var mapper = PokemonFormSpritesApiModelMapper();

  final String frontDefault;

  final String frontShiny;

  final String backDefault;

  final String backShiny;

  const PokemonFormSpritesApiModel({
    required this.frontDefault,
    required this.frontShiny,
    required this.backDefault,
    required this.backShiny,
  });
}

class PokemonFormSpritesApiModelMapper extends Mapper<PokemonFormSpritesApiModel> {
  @override
  PokemonFormSpritesApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonFormSpritesApiModel(
      frontDefault: map?['front_default'] ?? '',
      frontShiny: map?['front_shiny'] ?? '',
      backDefault: map?['back_default'] ?? '',
      backShiny: map?['back_shiny'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonFormSpritesApiModel value) {
    return {
      'front_default': value.frontDefault,
      'front_shiny': value.frontShiny,
      'back_default': value.backDefault,
      'back_shiny': value.backShiny,
    };
  }
}

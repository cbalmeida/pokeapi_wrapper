import '../core.dart';

class PokemonSpritesApiModel extends ApiModel {
  static var mapper = PokemonSpritesApiModelMapper();

  final String frontDefault;

  final String frontShiny;

  final String frontFemale;

  final String frontShinyFemale;

  final String backDefault;

  final String backShiny;

  final String backFemale;

  final String backShinyFemale;

  final String officialArtwork;

  const PokemonSpritesApiModel({
    required this.frontDefault,
    required this.frontShiny,
    required this.frontFemale,
    required this.frontShinyFemale,
    required this.backDefault,
    required this.backShiny,
    required this.backFemale,
    required this.backShinyFemale,
    required this.officialArtwork,
  });
}

class PokemonSpritesApiModelMapper extends Mapper<PokemonSpritesApiModel> {
  @override
  PokemonSpritesApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonSpritesApiModel(
      frontDefault: map?['front_default'] ?? '',
      frontShiny: map?['front_shiny'] ?? '',
      frontFemale: map?['front_female'] ?? '',
      frontShinyFemale: map?['front_shiny_female'] ?? '',
      backDefault: map?['back_default'] ?? '',
      backShiny: map?['back_shiny'] ?? '',
      backFemale: map?['back_female'] ?? '',
      backShinyFemale: map?['back_shiny_female'] ?? '',
      officialArtwork: map?['other']?['official-artwork']?['front_default'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonSpritesApiModel value) {
    return {
      'front_default': value.frontDefault,
      'front_shiny': value.frontShiny,
      'front_female': value.frontFemale,
      'front_shiny_female': value.frontShinyFemale,
      'back_default': value.backDefault,
      'back_shiny': value.backShiny,
      'back_female': value.backFemale,
      'back_shiny_female': value.backShinyFemale,
    };
  }
}

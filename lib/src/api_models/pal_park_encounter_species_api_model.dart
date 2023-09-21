import '../../pokeapi_wrapper.dart';

class PalParkEncounterSpeciesApiModel {
  static var mapper = PalParkEncounterSpeciesApiModelMapper();

  final int baseScore;

  final int rate;

  final PokemonSpeciesApiResource pokemonSpecies;

  const PalParkEncounterSpeciesApiModel({
    required this.baseScore,
    required this.rate,
    required this.pokemonSpecies,
  });
}

class PalParkEncounterSpeciesApiModelMapper extends Mapper<PalParkEncounterSpeciesApiModel> {
  @override
  PalParkEncounterSpeciesApiModel fromMap(Map<String, dynamic>? map) {
    return PalParkEncounterSpeciesApiModel(
      baseScore: map?['base_score'] ?? 0,
      rate: map?['rate'] ?? 0,
      pokemonSpecies: PokemonSpeciesApiResource.mapper.fromMap(map?['pokemon_species']),
    );
  }

  @override
  Map<String, dynamic> toMap(PalParkEncounterSpeciesApiModel value) {
    return {
      'base_score': value.baseScore,
      'rate': value.rate,
      'pokemon_species': PokemonSpeciesApiResource.mapper.toMap(value.pokemonSpecies),
    };
  }
}

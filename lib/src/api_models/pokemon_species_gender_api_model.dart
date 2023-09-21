import '../../pokeapi_wrapper.dart';

class PokemonSpeciesGenderApiModel extends ApiModel {
  static var mapper = PokemonSpeciesGenderApiModelMapper();

  final int rate;

  final PokemonSpeciesApiResource pokemonSpecies;

  const PokemonSpeciesGenderApiModel({
    required this.rate,
    required this.pokemonSpecies,
  });
}

class PokemonSpeciesGenderApiModelMapper extends Mapper<PokemonSpeciesGenderApiModel> {
  @override
  PokemonSpeciesGenderApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonSpeciesGenderApiModel(
      rate: map?['rate'] ?? 0,
      pokemonSpecies: PokemonSpeciesApiResource.mapper.fromMap(map?['pokemon_species']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonSpeciesGenderApiModel value) {
    return {
      'rate': value.rate,
      'pokemon_species': PokemonSpeciesApiResource.mapper.toMap(value.pokemonSpecies),
    };
  }
}

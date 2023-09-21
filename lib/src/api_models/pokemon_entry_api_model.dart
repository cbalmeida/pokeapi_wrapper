import '../../pokeapi_wrapper.dart';

class PokemonEntryApiModel extends ApiModel {
  static var mapper = PokemonEntryApiModelMapper();

  final int entryNumber;

  final PokemonSpeciesApiResource pokemonSpecies;

  const PokemonEntryApiModel({
    required this.entryNumber,
    required this.pokemonSpecies,
  });
}

class PokemonEntryApiModelMapper extends Mapper<PokemonEntryApiModel> {
  @override
  PokemonEntryApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonEntryApiModel(
      entryNumber: map?['entry_number'] ?? 0,
      pokemonSpecies: PokemonSpeciesApiResource.mapper.fromMap(map?['pokemon_species'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonEntryApiModel value) {
    return {
      'entry_number': value.entryNumber,
      'pokemon_species': PokemonSpeciesApiResource.mapper.toMap(value.pokemonSpecies),
    };
  }
}

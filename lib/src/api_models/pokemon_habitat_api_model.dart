import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class PokemonHabitatApiModel extends ApiModel {
  static var mapper = PokemonHabitatApiModelMapper();

  final int id;

  final String name;

  final List<NameApiModel> names;

  final List<PokemonSpeciesApiResource> pokemonSpecies;

  const PokemonHabitatApiModel({
    required this.id,
    required this.name,
    required this.names,
    required this.pokemonSpecies,
  });
}

class PokemonHabitatApiModelMapper extends Mapper<PokemonHabitatApiModel> {
  @override
  PokemonHabitatApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonHabitatApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      names: NameApiModel.mapper.fromList(map?['names']),
      pokemonSpecies: PokemonSpeciesApiResource.mapper.fromList(map?['pokemon_species']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonHabitatApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'names': NameApiModel.mapper.toList(value.names),
      'pokemon_species': PokemonSpeciesApiResource.mapper.toList(value.pokemonSpecies),
    };
  }
}

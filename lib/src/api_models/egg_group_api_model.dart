import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class EggGroupApiModel extends ApiModel {
  static var mapper = EggGroupApiModelMapper();

  final int id;

  final String name;

  final List<NameApiModel> names;

  final List<PokemonSpeciesApiResource> pokemonSpecies;

  const EggGroupApiModel({
    required this.id,
    required this.name,
    required this.names,
    required this.pokemonSpecies,
  });
}

class EggGroupApiModelMapper extends Mapper<EggGroupApiModel> {
  @override
  EggGroupApiModel fromMap(Map<String, dynamic>? map) {
    return EggGroupApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      names: NameApiModel.mapper.fromList(map?['names']),
      pokemonSpecies: PokemonSpeciesApiResource.mapper.fromList(map?['pokemon_species']),
    );
  }

  @override
  Map<String, dynamic> toMap(EggGroupApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'names': NameApiModel.mapper.toList(value.names),
      'pokemon_species': PokemonSpeciesApiResource.mapper.toList(value.pokemonSpecies),
    };
  }
}

import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class PokemonShapeApiModel extends ApiModel {
  static var mapper = PokemonShapeApiModelMapper();

  final int id;

  final String name;

  final List<AwesomeNameApiModel> awesomeNames;

  final List<NameApiModel> names;

  final List<PokemonSpeciesApiResource> pokemonSpecies;

  const PokemonShapeApiModel({
    required this.id,
    required this.name,
    required this.awesomeNames,
    required this.names,
    required this.pokemonSpecies,
  });
}

class PokemonShapeApiModelMapper extends Mapper<PokemonShapeApiModel> {
  @override
  PokemonShapeApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonShapeApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      awesomeNames: AwesomeNameApiModel.mapper.fromList(map?['awesome_names']),
      names: NameApiModel.mapper.fromList(map?['names']),
      pokemonSpecies: PokemonSpeciesApiResource.mapper.fromList(map?['pokemon_species']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonShapeApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'awesome_names': AwesomeNameApiModel.mapper.toList(value.awesomeNames),
      'names': NameApiModel.mapper.toList(value.names),
      'pokemon_species': PokemonSpeciesApiResource.mapper.toList(value.pokemonSpecies),
    };
  }
}

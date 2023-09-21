import '../../pokeapi_wrapper.dart';
import '../../src/api_models.dart';

class GenerationApiModel extends ApiModel {
  static var mapper = GenerationApiModelMapper();

  final int id;

  final String name;

  final List<AbilityApiResource> abilities;

  final List<NameApiModel> names;

  final RegionApiResource mainRegion;

  final List<MoveApiResource> moves;

  final List<PokemonSpeciesApiResource> pokemonSpecies;

  final List<TypeApiResource> types;

  final List<VersionGroupApiResource> versionGroups;

  const GenerationApiModel({
    required this.id,
    required this.name,
    required this.abilities,
    required this.names,
    required this.mainRegion,
    required this.moves,
    required this.pokemonSpecies,
    required this.types,
    required this.versionGroups,
  });
}

class GenerationApiModelMapper extends Mapper<GenerationApiModel> {
  @override
  GenerationApiModel fromMap(Map<String, dynamic>? map) {
    return GenerationApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      abilities: AbilityApiResource.mapper.fromList(map?['abilities']),
      names: NameApiModel.mapper.fromList(map?['names']),
      mainRegion: RegionApiResource.mapper.fromMap(map?['main_region']),
      moves: MoveApiResource.mapper.fromList(map?['moves']),
      pokemonSpecies: PokemonSpeciesApiResource.mapper.fromList(map?['pokemon_species']),
      types: TypeApiResource.mapper.fromList(map?['types']),
      versionGroups: VersionGroupApiResource.mapper.fromList(map?['version_groups']),
    );
  }

  @override
  Map<String, dynamic> toMap(GenerationApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'abilities': AbilityApiResource.mapper.toList(value.abilities),
      'names': NameApiModel.mapper.toList(value.names),
      'main_region': RegionApiResource.mapper.toMap(value.mainRegion),
      'moves': MoveApiResource.mapper.toList(value.moves),
      'pokemon_species': PokemonSpeciesApiResource.mapper.toList(value.pokemonSpecies),
      'types': TypeApiResource.mapper.toList(value.types),
      'version_groups': VersionGroupApiResource.mapper.toList(value.versionGroups),
    };
  }
}

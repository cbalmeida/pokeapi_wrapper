import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class RegionApiModel extends ApiModel {
  static var mapper = RegionApiModelMapper();

  final int id;

  final List<LocationApiResource> locations;

  final String name;

  final List<NameApiModel> names;

  final GenerationApiResource mainGeneration;

  final List<PokedexApiResource> pokedexes;

  final List<VersionGroupApiResource> versionGroups;

  const RegionApiModel({
    required this.id,
    required this.locations,
    required this.name,
    required this.names,
    required this.mainGeneration,
    required this.pokedexes,
    required this.versionGroups,
  });
}

class RegionApiModelMapper extends Mapper<RegionApiModel> {
  @override
  RegionApiModel fromMap(Map<String, dynamic>? map) {
    return RegionApiModel(
      id: map?['id'] ?? 0,
      locations: LocationApiResource.mapper.fromList(map?['locations']),
      name: map?['name'] ?? '',
      names: NameApiModel.mapper.fromList(map?['names']),
      mainGeneration: GenerationApiResource.mapper.fromMap(map?['main_generation']),
      pokedexes: PokedexApiResource.mapper.fromList(map?['pokedexes']),
      versionGroups: VersionGroupApiResource.mapper.fromList(map?['version_groups']),
    );
  }

  @override
  Map<String, dynamic> toMap(RegionApiModel value) {
    return {
      'id': value.id,
      'locations': LocationApiResource.mapper.toList(value.locations),
      'name': value.name,
      'names': NameApiModel.mapper.toList(value.names),
      'main_generation': GenerationApiResource.mapper.toMap(value.mainGeneration),
      'pokedexes': PokedexApiResource.mapper.toList(value.pokedexes),
      'version_groups': VersionGroupApiResource.mapper.toList(value.versionGroups),
    };
  }
}

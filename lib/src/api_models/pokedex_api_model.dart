import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class PokedexApiModel extends ApiModel {
  static var mapper = PokedexModelMapper();

  final int id;

  final String name;

  final bool isMainSeries;

  final List<DescriptionApiModel> descriptions;

  final List<NameApiModel> names;

  final List<PokemonEntryApiModel> pokemonEntries;

  final RegionApiResource region;

  final List<VersionGroupApiResource> versionGroups;

  const PokedexApiModel({
    required this.id,
    required this.name,
    required this.isMainSeries,
    required this.descriptions,
    required this.names,
    required this.pokemonEntries,
    required this.region,
    required this.versionGroups,
  });
}

class PokedexModelMapper extends Mapper<PokedexApiModel> {
  @override
  PokedexApiModel fromMap(Map<String, dynamic>? map) {
    return PokedexApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      isMainSeries: map?['is_main_series'] ?? false,
      descriptions: DescriptionApiModel.mapper.fromList(map?['descriptions']),
      names: NameApiModel.mapper.fromList(map?['names']),
      pokemonEntries: PokemonEntryApiModel.mapper.fromList(map?['pokemon_entries']),
      region: RegionApiResource.mapper.fromMap(map?['region']),
      versionGroups: VersionGroupApiResource.mapper.fromList(map?['version_groups']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokedexApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'is_main_series': value.isMainSeries,
      'descriptions': DescriptionApiModel.mapper.toList(value.descriptions),
      'names': NameApiModel.mapper.toList(value.names),
      'pokemon_entries': PokemonEntryApiModel.mapper.toList(value.pokemonEntries),
      'region': RegionApiResource.mapper.toMap(value.region),
      'version_groups': VersionGroupApiResource.mapper.toList(value.versionGroups),
    };
  }
}

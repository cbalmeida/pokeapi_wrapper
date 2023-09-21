import '../../pokeapi_wrapper.dart';

class VersionGroupApiModel extends ApiModel {
  static var mapper = VersionGroupApiModelMapper();

  final int id;

  final String name;

  final int order;

  final GenerationApiResource generation;

  final List<MoveLearnMethodApiResource> moveLearnMethods;

  final List<PokedexApiResource> pokedexes;

  final List<RegionApiResource> regions;

  final List<VersionApiResource> versions;

  const VersionGroupApiModel({
    required this.id,
    required this.name,
    required this.order,
    required this.generation,
    required this.moveLearnMethods,
    required this.pokedexes,
    required this.regions,
    required this.versions,
  });
}

class VersionGroupApiModelMapper extends Mapper<VersionGroupApiModel> {
  @override
  VersionGroupApiModel fromMap(Map<String, dynamic>? map) {
    return VersionGroupApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      order: map?['order'] ?? 0,
      generation: GenerationApiResource.mapper.fromMap(map?['generation']),
      moveLearnMethods: MoveLearnMethodApiResource.mapper.fromList(map?['move_learn_methods']),
      pokedexes: PokedexApiResource.mapper.fromList(map?['pokedexes']),
      regions: RegionApiResource.mapper.fromList(map?['regions']),
      versions: VersionApiResource.mapper.fromList(map?['versions']),
    );
  }

  @override
  Map<String, dynamic> toMap(VersionGroupApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'order': value.order,
      'generation': GenerationApiResource.mapper.toMap(value.generation),
      'move_learn_methods': MoveLearnMethodApiResource.mapper.toList(value.moveLearnMethods),
      'pokedexes': PokedexApiResource.mapper.toList(value.pokedexes),
      'regions': RegionApiResource.mapper.toList(value.regions),
      'versions': VersionApiResource.mapper.toList(value.versions),
    };
  }
}

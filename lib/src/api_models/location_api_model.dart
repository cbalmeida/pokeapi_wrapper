import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class LocationApiModel extends ApiModel {
  static var mapper = LocationApiModelMapper();

  final int id;

  final String name;

  final RegionApiResource region;

  final List<NameApiModel> names;

  final List<GenerationGameIndexApiModel> gameIndices;

  final List<LocationAreaApiResource> areas;

  const LocationApiModel({
    required this.id,
    required this.name,
    required this.region,
    required this.names,
    required this.gameIndices,
    required this.areas,
  });
}

class LocationApiModelMapper extends Mapper<LocationApiModel> {
  @override
  LocationApiModel fromMap(Map<String, dynamic>? map) {
    return LocationApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      region: RegionApiResource.mapper.fromMap(map?['region']),
      names: NameApiModel.mapper.fromList(map?['names']),
      gameIndices: GenerationGameIndexApiModel.mapper.fromList(map?['game_indices']),
      areas: LocationAreaApiResource.mapper.fromList(map?['areas']),
    );
  }

  @override
  Map<String, dynamic> toMap(LocationApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'region': RegionApiResource.mapper.toMap(value.region),
      'names': NameApiModel.mapper.toList(value.names),
      'game_indices': GenerationGameIndexApiModel.mapper.toList(value.gameIndices),
      'areas': LocationAreaApiResource.mapper.toList(value.areas),
    };
  }
}

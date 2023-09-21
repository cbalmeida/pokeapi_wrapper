import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class LocationAreaEncounter extends Model<LocationAreaEncounterApiModel> {
  static var adapter = LocationAreaEncounterAdapter();

  const LocationAreaEncounter({required super.service, required super.apiModel});

  /// The location area the referenced Pokémon can be encountered in.
  Future<Either<Error, LocationArea>> get locationArea => LocationArea.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.locationArea);

  /// A list of versions and encounters with the referenced Pokémon that might happen.
  List<VersionEncounterDetail> get versionDetails => VersionEncounterDetail.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.versionDetails);
}

class LocationAreaEncounterAdapter extends ApiResourceAdapter<LocationAreaEncounterApiModel, LocationAreaEncounter, LocationAreaEncounterApiResource> {
  @override
  Future<Either<Error, LocationAreaEncounterApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getLocationAreaEncounter(apiResource.url);
  }

  @override
  LocationAreaEncounter createModelFromApiModel({required IService service, required LocationAreaEncounterApiModel apiModel}) {
    return LocationAreaEncounter(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/location-area-encounter';

  @override
  Future<Either<Error, List<LocationAreaEncounterApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    throw UnimplementedError();
  }
}

class LocationAreaEncounterApiResource extends ApiResource {
  const LocationAreaEncounterApiResource({required super.url});

  static get mapper => LocationAreaEncounterApiResourceMapper();
}

class LocationAreaEncounterApiResourceMapper extends ApiResourceMapper<LocationAreaEncounterApiResource> {
  @override
  LocationAreaEncounterApiResource fromUrl(String url) {
    return LocationAreaEncounterApiResource(url: url);
  }
}

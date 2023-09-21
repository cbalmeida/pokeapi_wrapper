import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Location extends Model<LocationApiModel> {
  static var adapter = LocationAdapter();

  const Location({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The region this location can be found in.
  Future<Either<Error, Region>> get region => Region.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.region);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of game indices relevant to this location by generation.
  List<GenerationGameIndex> get gameIndices => GenerationGameIndex.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.gameIndices);

  /// Areas that can be found within this location.
  Future<Either<Error, List<LocationArea>>> get areas => LocationArea.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.areas);
}

class LocationAdapter extends ApiResourceAdapter<LocationApiModel, Location, LocationApiResource> {
  @override
  Future<Either<Error, LocationApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getLocation(apiResource.url);
  }

  @override
  Location createModelFromApiModel({required IService service, required LocationApiModel apiModel}) {
    return Location(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/location';

  @override
  Future<Either<Error, List<LocationApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getLocationList(offSet: offSet, limit: limit);
  }
}

class LocationApiResource extends ApiResource {
  const LocationApiResource({required super.url});

  static get mapper => LocationApiResourceMapper();
}

class LocationApiResourceMapper extends ApiResourceMapper<LocationApiResource> {
  @override
  LocationApiResource fromUrl(String url) {
    return LocationApiResource(url: url);
  }
}

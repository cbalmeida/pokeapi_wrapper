import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class LocationArea extends Model<LocationAreaApiModel> {
  static var adapter = LocationAreaAdapter();

  const LocationArea({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The internal id of an API resource within game data.
  int get gameIndex => apiModel.gameIndex;

  /// A list of methods in which Pokémon may be encountered in this area and how likely the method will occur depending on the version of the game.
  List<EncounterMethodRate> get encounterMethodRates => EncounterMethodRate.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.encounterMethodRates);

  /// The region this location area can be found in.
  Future<Either<Error, Location>> get location => Location.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.location);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of Pokémon that can be encountered in this area along with version specific details about the encounter.
  List<PokemonEncounter> get pokemonEncounters => PokemonEncounter.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pokemonEncounters);
}

class LocationAreaAdapter extends ApiResourceAdapter<LocationAreaApiModel, LocationArea, LocationAreaApiResource> {
  @override
  Future<Either<Error, LocationAreaApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getLocationArea(apiResource.url);
  }

  @override
  LocationArea createModelFromApiModel({required IService service, required LocationAreaApiModel apiModel}) {
    return LocationArea(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/location-area';

  @override
  Future<Either<Error, List<LocationAreaApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getLocationAreaList(offSet: offSet, limit: limit);
  }
}

class LocationAreaApiResource extends ApiResource {
  const LocationAreaApiResource({required super.url});

  static get mapper => LocationAreaApiResourceMapper();
}

class LocationAreaApiResourceMapper extends ApiResourceMapper<LocationAreaApiResource> {
  @override
  LocationAreaApiResource fromUrl(String url) {
    return LocationAreaApiResource(url: url);
  }
}

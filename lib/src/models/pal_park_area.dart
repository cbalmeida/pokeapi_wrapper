import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PalParkArea extends Model<PalParkAreaApiModel> {
  static var adapter = PalParkAreaAdapter();

  const PalParkArea({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of Pokémon encountered in this pal park area along with details.
  List<PalParkEncounterSpecies> get pokemonEncounters => PalParkEncounterSpecies.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pokemonEncounters);
}

class PalParkAreaAdapter extends ApiResourceAdapter<PalParkAreaApiModel, PalParkArea, PalParkAreaApiResource> {
  @override
  Future<Either<Error, PalParkAreaApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getPalParkArea(apiResource.url);
  }

  @override
  PalParkArea createModelFromApiModel({required IService service, required PalParkAreaApiModel apiModel}) {
    return PalParkArea(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/pal-park-area';

  @override
  Future<Either<Error, List<PalParkAreaApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getPalParkAreaList(offSet: offSet, limit: limit);
  }
}

class PalParkAreaApiResource extends ApiResource {
  const PalParkAreaApiResource({required super.url});

  static get mapper => PalParkAreaApiResourceMapper();
}

class PalParkAreaApiResourceMapper extends ApiResourceMapper<PalParkAreaApiResource> {
  @override
  PalParkAreaApiResource fromUrl(String url) {
    return PalParkAreaApiResource(url: url);
  }
}

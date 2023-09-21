import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class BerryFlavor extends Model<BerryFlavorApiModel> {
  static var adapter = BerryFlavorAdapter();

  const BerryFlavor({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// A list of the berries with this flavor.
  List<FlavorBerryMap> get berries => FlavorBerryMap.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.berries);

  /// The contest type that correlates with this berry flavor.
  Future<Either<Error, ContestType>> get contestType => ContestType.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.contestType);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class BerryFlavorAdapter extends ApiResourceAdapter<BerryFlavorApiModel, BerryFlavor, BerryFlavorApiResource> {
  @override
  Future<Either<Error, BerryFlavorApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getBerryFlavor(apiResource.url);
  }

  @override
  BerryFlavor createModelFromApiModel({required IService service, required BerryFlavorApiModel apiModel}) {
    return BerryFlavor(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/berry-flavor';

  @override
  Future<Either<Error, List<BerryFlavorApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getBerryFlavorList(offSet: offSet, limit: limit);
  }
}

class BerryFlavorApiResource extends ApiResource {
  const BerryFlavorApiResource({required super.url});

  static get mapper => BerryFlavorApiResourceMapper();
}

class BerryFlavorApiResourceMapper extends ApiResourceMapper<BerryFlavorApiResource> {
  @override
  BerryFlavorApiResource fromUrl(String url) {
    return BerryFlavorApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class BerryFirmness extends Model<BerryFirmnessApiModel> {
  static var adapter = BerryFirmnessAdapter();

  const BerryFirmness({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// A list of the berries with this firmness.
  Future<Either<Error, List<Berry>>> get berries => Berry.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.berries);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class BerryFirmnessAdapter extends ApiResourceAdapter<BerryFirmnessApiModel, BerryFirmness, BerryFirmnessApiResource> {
  @override
  Future<Either<Error, BerryFirmnessApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getBerryFirmness(apiResource.url);
  }

  @override
  BerryFirmness createModelFromApiModel({required IService service, required BerryFirmnessApiModel apiModel}) {
    return BerryFirmness(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/berry-firmness';

  @override
  Future<Either<Error, List<BerryFirmnessApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getBerryFirmnessList(offSet: offSet, limit: limit);
  }
}

class BerryFirmnessApiResource extends ApiResource {
  const BerryFirmnessApiResource({required super.url});

  static get mapper => BerryFirmnessApiResourceMapper();
}

class BerryFirmnessApiResourceMapper extends ApiResourceMapper<BerryFirmnessApiResource> {
  @override
  BerryFirmnessApiResource fromUrl(String url) {
    return BerryFirmnessApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ContestType extends Model<ContestTypeApiModel> {
  static var adapter = ContestTypeAdapter();

  const ContestType({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this contest type resource.
  String get name => apiModel.name;

  /// The berry flavor that correlates with this contest type.
  Future<Either<Error, BerryFlavor>> get berryFlavor => BerryFlavor.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.berryFlavor);

  /// The name of this contest type listed in different languages.
  List<ContestName> get names => ContestName.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class ContestTypeAdapter extends ApiResourceAdapter<ContestTypeApiModel, ContestType, ContestTypeApiResource> {
  @override
  Future<Either<Error, ContestTypeApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getContestType(apiResource.url);
  }

  @override
  ContestType createModelFromApiModel({required IService service, required ContestTypeApiModel apiModel}) {
    return ContestType(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/contest-type';

  @override
  Future<Either<Error, List<ContestTypeApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getContestTypeList(offSet: offSet, limit: limit);
  }
}

class ContestTypeApiResource extends ApiResource {
  const ContestTypeApiResource({required super.url});

  static get mapper => ContestTypeApiResourceMapper();
}

class ContestTypeApiResourceMapper extends ApiResourceMapper<ContestTypeApiResource> {
  @override
  ContestTypeApiResource fromUrl(String url) {
    return ContestTypeApiResource(url: url);
  }
}

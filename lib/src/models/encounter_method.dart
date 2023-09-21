import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class EncounterMethod extends Model<EncounterMethodApiModel> {
  static var adapter = EncounterMethodAdapter();

  const EncounterMethod({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// A good value for sorting.
  int get order => apiModel.order;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class EncounterMethodAdapter extends ApiResourceAdapter<EncounterMethodApiModel, EncounterMethod, EncounterMethodApiResource> {
  @override
  Future<Either<Error, EncounterMethodApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getEncounterMethod(apiResource.url);
  }

  @override
  EncounterMethod createModelFromApiModel({required IService service, required EncounterMethodApiModel apiModel}) {
    return EncounterMethod(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/encounter-method';

  @override
  Future<Either<Error, List<EncounterMethodApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getEncounterMethodList(offSet: offSet, limit: limit);
  }
}

class EncounterMethodApiResource extends ApiResource {
  const EncounterMethodApiResource({required super.url});

  static get mapper => EncounterMethodApiResourceMapper();
}

class EncounterMethodApiResourceMapper extends ApiResourceMapper<EncounterMethodApiResource> {
  @override
  EncounterMethodApiResource fromUrl(String url) {
    return EncounterMethodApiResource(url: url);
  }
}

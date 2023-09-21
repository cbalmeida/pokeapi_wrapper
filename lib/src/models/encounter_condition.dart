import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class EncounterCondition extends Model<EncounterConditionApiModel> {
  static var adapter = EncounterConditionAdapter();

  const EncounterCondition({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of possible values for this encounter condition.
  Future<Either<Error, List<EncounterConditionValue>>> get values => EncounterConditionValue.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.values);
}

class EncounterConditionAdapter extends ApiResourceAdapter<EncounterConditionApiModel, EncounterCondition, EncounterConditionApiResource> {
  @override
  Future<Either<Error, EncounterConditionApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getEncounterCondition(apiResource.url);
  }

  @override
  EncounterCondition createModelFromApiModel({required IService service, required EncounterConditionApiModel apiModel}) {
    return EncounterCondition(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/encounter-condition';

  @override
  Future<Either<Error, List<EncounterConditionApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getEncounterConditionList(offSet: offSet, limit: limit);
  }
}

class EncounterConditionApiResource extends ApiResource {
  const EncounterConditionApiResource({required super.url});

  static get mapper => EncounterConditionApiResourceMapper();
}

class EncounterConditionApiResourceMapper extends ApiResourceMapper<EncounterConditionApiResource> {
  @override
  EncounterConditionApiResource fromUrl(String url) {
    return EncounterConditionApiResource(url: url);
  }
}

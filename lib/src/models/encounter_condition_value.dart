import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class EncounterConditionValue extends Model<EncounterConditionValueApiModel> {
  static var adapter = EncounterConditionValueAdapter();

  const EncounterConditionValue({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The condition this encounter condition value pertains to.
  Future<Either<Error, EncounterCondition>> get condition => EncounterCondition.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.condition);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class EncounterConditionValueAdapter extends ApiResourceAdapter<EncounterConditionValueApiModel, EncounterConditionValue, EncounterConditionValueApiResource> {
  @override
  Future<Either<Error, EncounterConditionValueApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getEncounterConditionValue(apiResource.url);
  }

  @override
  EncounterConditionValue createModelFromApiModel({required IService service, required EncounterConditionValueApiModel apiModel}) {
    return EncounterConditionValue(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/encounter-condition-value';

  @override
  Future<Either<Error, List<EncounterConditionValueApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getEncounterConditionValueList(offSet: offSet, limit: limit);
  }
}

class EncounterConditionValueApiResource extends ApiResource {
  const EncounterConditionValueApiResource({required super.url});

  static get mapper => EncounterConditionValueApiResourceMapper();
}

class EncounterConditionValueApiResourceMapper extends ApiResourceMapper<EncounterConditionValueApiResource> {
  @override
  EncounterConditionValueApiResource fromUrl(String url) {
    return EncounterConditionValueApiResource(url: url);
  }
}

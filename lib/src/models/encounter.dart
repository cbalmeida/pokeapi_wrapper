import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Encounter extends Model<EncounterApiModel> {
  static var adapter = EncounterAdapter();

  const Encounter({required super.service, required super.apiModel});

  /// The lowest level the Pokémon could be encountered at.
  int get minLevel => apiModel.minLevel;

  /// The highest level the Pokémon could be encountered at.
  int get maxLevel => apiModel.maxLevel;

  /// A list of condition values that must be in effect for this encounter to occur.
  Future<Either<Error, List<EncounterConditionValue>>> get conditionValues => EncounterConditionValue.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.conditionValues);

  /// Percent chance that this encounter will occur.
  int get chance => apiModel.chance;

  /// The method by which this encounter happens.
  Future<Either<Error, EncounterMethod>> get method => EncounterMethod.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.method);
}

class EncounterAdapter extends ApiModelAdapter<EncounterApiModel, Encounter> {
  @override
  Encounter createModelFromApiModel({required IService service, required EncounterApiModel apiModel}) {
    return Encounter(service: service, apiModel: apiModel);
  }
}

class EncounterApiResource extends ApiResource {
  const EncounterApiResource({required super.url});

  static get mapper => EncounterApiResourceMapper();
}

class EncounterApiResourceMapper extends ApiResourceMapper<EncounterApiResource> {
  @override
  EncounterApiResource fromUrl(String url) {
    return EncounterApiResource(url: url);
  }
}

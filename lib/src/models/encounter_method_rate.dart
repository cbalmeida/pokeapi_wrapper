import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class EncounterMethodRate extends Model<EncounterMethodRateApiModel> {
  static var adapter = EncounterMethodRateAdapter();

  const EncounterMethodRate({required super.service, required super.apiModel});

  /// The method in which Pokémon may be encountered in an area..
  Future<Either<Error, EncounterMethod>> get encounterMethod => EncounterMethod.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.encounterMethod);

  /// The chance of the encounter to occur on a version of the game.
  List<EncounterVersionDetails> get versionDetails => EncounterVersionDetails.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.versionDetails);
}

class EncounterMethodRateAdapter extends ApiModelAdapter<EncounterMethodRateApiModel, EncounterMethodRate> {
  @override
  EncounterMethodRate createModelFromApiModel({required IService service, required EncounterMethodRateApiModel apiModel}) {
    return EncounterMethodRate(service: service, apiModel: apiModel);
  }
}

class EncounterMethodRateApiResource extends ApiResource {
  const EncounterMethodRateApiResource({required super.url});

  static get mapper => EncounterMethodRateApiResourceMapper();
}

class EncounterMethodRateApiResourceMapper extends ApiResourceMapper<EncounterMethodRateApiResource> {
  @override
  EncounterMethodRateApiResource fromUrl(String url) {
    return EncounterMethodRateApiResource(url: url);
  }
}

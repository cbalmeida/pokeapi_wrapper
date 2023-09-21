import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class EncounterVersionDetails extends Model<EncounterVersionDetailsApiModel> {
  static var adapter = EncounterVersionDetailsAdapter();

  const EncounterVersionDetails({required super.service, required super.apiModel});

  /// The chance of an encounter to occur.
  int get rate => apiModel.rate;

  /// The version of the game in which the encounter can occur with the given chance.
  Future<Either<Error, Version>> get version => Version.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.version);
}

class EncounterVersionDetailsAdapter extends ApiModelAdapter<EncounterVersionDetailsApiModel, EncounterVersionDetails> {
  @override
  EncounterVersionDetails createModelFromApiModel({required IService service, required EncounterVersionDetailsApiModel apiModel}) {
    return EncounterVersionDetails(service: service, apiModel: apiModel);
  }
}

class EncounterVersionDetailsApiResource extends ApiResource {
  const EncounterVersionDetailsApiResource({required super.url});

  static get mapper => EncounterVersionDetailsApiResourceMapper();
}

class EncounterVersionDetailsApiResourceMapper extends ApiResourceMapper<EncounterVersionDetailsApiResource> {
  @override
  EncounterVersionDetailsApiResource fromUrl(String url) {
    return EncounterVersionDetailsApiResource(url: url);
  }
}

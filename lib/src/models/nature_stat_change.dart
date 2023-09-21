import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class NatureStatChange extends Model<NatureStatChangeApiModel> {
  static var adapter = NatureStatChangeAdapter();

  const NatureStatChange({required super.service, required super.apiModel});

  /// The amount of change.
  int get maxChange => apiModel.maxChange;

  /// The stat being affected.
  Future<Either<Error, PokeathlonStat>> get pokeathlonStat => PokeathlonStat.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokeathlonStat);
}

class NatureStatChangeAdapter extends ApiModelAdapter<NatureStatChangeApiModel, NatureStatChange> {
  @override
  NatureStatChange createModelFromApiModel({required IService service, required NatureStatChangeApiModel apiModel}) {
    return NatureStatChange(service: service, apiModel: apiModel);
  }
}

class NatureStatChangeApiResource extends ApiResource {
  const NatureStatChangeApiResource({required super.url});

  static get mapper => NatureStatChangeApiResourceMapper();
}

class NatureStatChangeApiResourceMapper extends ApiResourceMapper<NatureStatChangeApiResource> {
  @override
  NatureStatChangeApiResource fromUrl(String url) {
    return NatureStatChangeApiResource(url: url);
  }
}

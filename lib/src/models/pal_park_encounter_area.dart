import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PalParkEncounterArea extends Model<PalParkEncounterAreaApiModel> {
  static var adapter = PalParkEncounterAreaAdapter();

  const PalParkEncounterArea({required super.service, required super.apiModel});

  /// The base score given to the player when the referenced Pokémon is caught during a pal park run.
  int get baseScore => apiModel.baseScore;

  /// The base rate for encountering the referenced Pokémon in this pal park area.
  int get rate => apiModel.rate;

  /// The pal park area where this encounter happens.
  Future<Either<Error, PalParkArea>> get area => PalParkArea.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.area);
}

class PalParkEncounterAreaAdapter extends ApiModelAdapter<PalParkEncounterAreaApiModel, PalParkEncounterArea> {
  @override
  PalParkEncounterArea createModelFromApiModel({required IService service, required PalParkEncounterAreaApiModel apiModel}) {
    return PalParkEncounterArea(service: service, apiModel: apiModel);
  }
}

class PalParkEncounterAreaApiResource extends ApiResource {
  const PalParkEncounterAreaApiResource({required super.url});

  static get mapper => PalParkEncounterAreaApiResourceMapper();
}

class PalParkEncounterAreaApiResourceMapper extends ApiResourceMapper<PalParkEncounterAreaApiResource> {
  @override
  PalParkEncounterAreaApiResource fromUrl(String url) {
    return PalParkEncounterAreaApiResource(url: url);
  }
}

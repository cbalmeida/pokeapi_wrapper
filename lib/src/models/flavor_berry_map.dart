import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class FlavorBerryMap extends Model<FlavorBerryMapApiModel> {
  static var adapter = FlavorBerryMapAdapter();

  const FlavorBerryMap({required super.service, required super.apiModel});

  /// How powerful the referenced flavor is for this berry.
  int get potency => apiModel.potency;

  /// The referenced berry.
  Future<Either<Error, Berry>> get berry => Berry.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.berry);
}

class FlavorBerryMapAdapter extends ApiModelAdapter<FlavorBerryMapApiModel, FlavorBerryMap> {
  @override
  FlavorBerryMap createModelFromApiModel({required IService service, required FlavorBerryMapApiModel apiModel}) {
    return FlavorBerryMap(service: service, apiModel: apiModel);
  }
}

class FlavorBerryMapApiResource extends ApiResource {
  const FlavorBerryMapApiResource({required super.url});

  static get mapper => FlavorBerryMapApiResourceMapper();
}

class FlavorBerryMapApiResourceMapper extends ApiResourceMapper<FlavorBerryMapApiResource> {
  @override
  FlavorBerryMapApiResource fromUrl(String url) {
    return FlavorBerryMapApiResource(url: url);
  }
}

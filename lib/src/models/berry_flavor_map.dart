import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class BerryFlavorMap extends Model<BerryFlavorMapApiModel> {
  static var adapter = BerryFlavorMapAdapter();

  const BerryFlavorMap({required super.service, required super.apiModel});

  /// How powerful the referenced flavor is for this berry
  int get potency => apiModel.potency;

  /// The referenced berry flavor
  Future<Either<Error, BerryFlavor>> get flavor => BerryFlavor.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.flavor);
}

class BerryFlavorMapAdapter extends ApiModelAdapter<BerryFlavorMapApiModel, BerryFlavorMap> {
  @override
  BerryFlavorMap createModelFromApiModel({required IService service, required BerryFlavorMapApiModel apiModel}) {
    return BerryFlavorMap(service: service, apiModel: apiModel);
  }
}

class BerryFlavorMapApiResource extends ApiResource {
  const BerryFlavorMapApiResource({required super.url});

  static get mapper => BerryFlavorMapApiResourceMapper();
}

class BerryFlavorMapApiResourceMapper extends ApiResourceMapper<BerryFlavorMapApiResource> {
  @override
  BerryFlavorMapApiResource fromUrl(String url) {
    return BerryFlavorMapApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveStatChange extends Model<MoveStatChangeApiModel> {
  static var adapter = MoveStatChangeAdapter();

  const MoveStatChange({required super.service, required super.apiModel});

  /// The amount of change.
  int get change => apiModel.change;

  /// The stat being affected.
  Future<Either<Error, Stat>> get stat => Stat.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.stat);
}

class MoveStatChangeAdapter extends ApiModelAdapter<MoveStatChangeApiModel, MoveStatChange> {
  @override
  MoveStatChange createModelFromApiModel({required IService service, required MoveStatChangeApiModel apiModel}) {
    return MoveStatChange(service: service, apiModel: apiModel);
  }
}

class MoveStatChangeApiResource extends ApiResource {
  const MoveStatChangeApiResource({required super.url});

  static get mapper => MoveStatChangeApiResourceMapper();
}

class MoveStatChangeApiResourceMapper extends ApiResourceMapper<MoveStatChangeApiResource> {
  @override
  MoveStatChangeApiResource fromUrl(String url) {
    return MoveStatChangeApiResource(url: url);
  }
}

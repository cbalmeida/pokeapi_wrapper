import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveStatAffect extends Model<MoveStatAffectApiModel> {
  static var adapter = MoveStatAffectAdapter();

  const MoveStatAffect({required super.service, required super.apiModel});

  /// The maximum amount of change to the referenced stat.
  int get change => apiModel.change;

  /// The move causing the change.
  Future<Either<Error, Move>> get move => Move.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.move);
}

class MoveStatAffectAdapter extends ApiModelAdapter<MoveStatAffectApiModel, MoveStatAffect> {
  @override
  MoveStatAffect createModelFromApiModel({required IService service, required MoveStatAffectApiModel apiModel}) {
    return MoveStatAffect(service: service, apiModel: apiModel);
  }
}

class MoveStatAffectApiResource extends ApiResource {
  const MoveStatAffectApiResource({required super.url});

  static get mapper => MoveStatAffectApiResourceMapper();
}

class MoveStatAffectApiResourceMapper extends ApiResourceMapper<MoveStatAffectApiResource> {
  @override
  MoveStatAffectApiResource fromUrl(String url) {
    return MoveStatAffectApiResource(url: url);
  }
}

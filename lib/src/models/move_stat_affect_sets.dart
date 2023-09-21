import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveStatAffectSets extends Model<MoveStatAffectSetsApiModel> {
  static var adapter = MoveStatAffectSetsAdapter();

  const MoveStatAffectSets({required super.service, required super.apiModel});

  /// A list of moves and how they change the referenced stat.
  List<MoveStatAffect> get increase => MoveStatAffect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.increase);

  /// A list of moves and how they change the referenced stat.
  List<MoveStatAffect> get decrease => MoveStatAffect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.decrease);
}

class MoveStatAffectSetsAdapter extends ApiModelAdapter<MoveStatAffectSetsApiModel, MoveStatAffectSets> {
  @override
  MoveStatAffectSets createModelFromApiModel({required IService service, required MoveStatAffectSetsApiModel apiModel}) {
    return MoveStatAffectSets(service: service, apiModel: apiModel);
  }
}

class MoveStatAffectSetsApiResource extends ApiResource {
  const MoveStatAffectSetsApiResource({required super.url});

  static get mapper => MoveStatAffectSetsApiResourceMapper();
}

class MoveStatAffectSetsApiResourceMapper extends ApiResourceMapper<MoveStatAffectSetsApiResource> {
  @override
  MoveStatAffectSetsApiResource fromUrl(String url) {
    return MoveStatAffectSetsApiResource(url: url);
  }
}

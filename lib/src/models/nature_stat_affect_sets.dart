import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class NatureStatAffectSets extends Model<NatureStatAffectSetsApiModel> {
  static var adapter = NatureStatAffectSetsAdapter();

  const NatureStatAffectSets({required super.service, required super.apiModel});

  /// A list of moves and how they change the referenced stat.
  List<MoveStatAffect> get increase => MoveStatAffect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.increase);

  /// A list of moves and how they change the referenced stat.
  List<MoveStatAffect> get decrease => MoveStatAffect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.decrease);
}

class NatureStatAffectSetsAdapter extends ApiModelAdapter<NatureStatAffectSetsApiModel, NatureStatAffectSets> {
  @override
  NatureStatAffectSets createModelFromApiModel({required IService service, required NatureStatAffectSetsApiModel apiModel}) {
    return NatureStatAffectSets(service: service, apiModel: apiModel);
  }
}

class NatureStatAffectSetsApiResource extends ApiResource {
  const NatureStatAffectSetsApiResource({required super.url});

  static get mapper => NatureStatAffectSetsApiResourceMapper();
}

class NatureStatAffectSetsApiResourceMapper extends ApiResourceMapper<NatureStatAffectSetsApiResource> {
  @override
  NatureStatAffectSetsApiResource fromUrl(String url) {
    return NatureStatAffectSetsApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class NaturePokeathlonStatAffectSets extends Model<NaturePokeathlonStatAffectSetsApiModel> {
  static var adapter = NaturePokeathlonStatAffectSetsAdapter();

  const NaturePokeathlonStatAffectSets({required super.service, required super.apiModel});

  /// A list of natures and how they change the referenced Pokéathlon stat.
  List<NaturePokeathlonStatAffect> get increase => NaturePokeathlonStatAffect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.increase);

  /// A list of natures and how they change the referenced Pokéathlon stat.
  List<NaturePokeathlonStatAffect> get decrease => NaturePokeathlonStatAffect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.decrease);
}

class NaturePokeathlonStatAffectSetsAdapter extends ApiModelAdapter<NaturePokeathlonStatAffectSetsApiModel, NaturePokeathlonStatAffectSets> {
  @override
  NaturePokeathlonStatAffectSets createModelFromApiModel({required IService service, required NaturePokeathlonStatAffectSetsApiModel apiModel}) {
    return NaturePokeathlonStatAffectSets(service: service, apiModel: apiModel);
  }
}

class NaturePokeathlonStatAffectSetsApiResource extends ApiResource {
  const NaturePokeathlonStatAffectSetsApiResource({required super.url});

  static get mapper => NaturePokeathlonStatAffectSetsApiResourceMapper();
}

class NaturePokeathlonStatAffectSetsApiResourceMapper extends ApiResourceMapper<NaturePokeathlonStatAffectSetsApiResource> {
  @override
  NaturePokeathlonStatAffectSetsApiResource fromUrl(String url) {
    return NaturePokeathlonStatAffectSetsApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class NaturePokeathlonStatAffect extends Model<NaturePokeathlonStatAffectApiModel> {
  static var adapter = NaturePokeathlonStatAffectAdapter();

  const NaturePokeathlonStatAffect({required super.service, required super.apiModel});

  /// The maximum amount of change to the referenced Pokéathlon stat.
  int get maxChange => apiModel.maxChange;

  /// The nature causing the change.
  Future<Either<Error, Nature>> get nature => Nature.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.nature);
}

class NaturePokeathlonStatAffectAdapter extends ApiModelAdapter<NaturePokeathlonStatAffectApiModel, NaturePokeathlonStatAffect> {
  @override
  NaturePokeathlonStatAffect createModelFromApiModel({required IService service, required NaturePokeathlonStatAffectApiModel apiModel}) {
    return NaturePokeathlonStatAffect(service: service, apiModel: apiModel);
  }
}

class NaturePokeathlonStatAffectApiResource extends ApiResource {
  const NaturePokeathlonStatAffectApiResource({required super.url});

  static get mapper => NaturePokeathlonStatAffectApiResourceMapper();
}

class NaturePokeathlonStatAffectApiResourceMapper extends ApiResourceMapper<NaturePokeathlonStatAffectApiResource> {
  @override
  NaturePokeathlonStatAffectApiResource fromUrl(String url) {
    return NaturePokeathlonStatAffectApiResource(url: url);
  }
}

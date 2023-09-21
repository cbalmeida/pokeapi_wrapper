import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Effect extends Model<EffectApiModel> {
  static var adapter = EffectAdapter();

  const Effect({required super.service, required super.apiModel});

  /// The localized effect text for an API resource in a specific language.
  String get effect => apiModel.effect;

  /// The language this effect is in.
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);
}

class EffectAdapter extends ApiModelAdapter<EffectApiModel, Effect> {
  @override
  Effect createModelFromApiModel({required IService service, required EffectApiModel apiModel}) {
    return Effect(service: service, apiModel: apiModel);
  }
}

class EffectApiResource extends ApiResource {
  const EffectApiResource({required super.url});

  static get mapper => EffectApiResourceMapper();
}

class EffectApiResourceMapper extends ApiResourceMapper<EffectApiResource> {
  @override
  EffectApiResource fromUrl(String url) {
    return EffectApiResource(url: url);
  }
}

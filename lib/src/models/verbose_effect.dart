import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class VerboseEffect extends Model<VerboseEffectApiModel> {
  static var adapter = VerboseEffectAdapter();

  const VerboseEffect({required super.service, required super.apiModel});

  /// The localized effect text for an API resource in a specific language.
  String get effect => apiModel.effect;

  /// The localized effect text in brief.
  String get shortEffect => apiModel.shortEffect;

  /// The language this effect is in.
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);
}

class VerboseEffectAdapter extends ApiModelAdapter<VerboseEffectApiModel, VerboseEffect> {
  @override
  VerboseEffect createModelFromApiModel({required IService service, required VerboseEffectApiModel apiModel}) {
    return VerboseEffect(service: service, apiModel: apiModel);
  }
}

class VerboseEffectApiResource extends ApiResource {
  const VerboseEffectApiResource({required super.url});

  static get mapper => VerboseEffectApiResourceMapper();
}

class VerboseEffectApiResourceMapper extends ApiResourceMapper<VerboseEffectApiResource> {
  @override
  VerboseEffectApiResource fromUrl(String url) {
    return VerboseEffectApiResource(url: url);
  }
}

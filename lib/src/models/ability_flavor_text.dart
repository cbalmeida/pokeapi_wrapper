import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class AbilityFlavorText extends Model<AbilityFlavorTextApiModel> {
  static var adapter = AbilityFlavorTextAdapter();

  const AbilityFlavorText({required super.service, required super.apiModel});

  /// The localized flavor text for an API resource in a specific language.
  String get flavorText => apiModel.flavorText;

  /// The language this name is in.
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);

  /// The version group that uses this flavor text.
  Future<Either<Error, VersionGroup>> get versionGroup => VersionGroup.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.versionGroup);
}

class AbilityFlavorTextAdapter extends ApiModelAdapter<AbilityFlavorTextApiModel, AbilityFlavorText> {
  @override
  AbilityFlavorText createModelFromApiModel({required IService service, required AbilityFlavorTextApiModel apiModel}) {
    return AbilityFlavorText(service: service, apiModel: apiModel);
  }
}

class AbilityFlavorTextApiResource extends ApiResource {
  const AbilityFlavorTextApiResource({required super.url});

  static get mapper => AbilityFlavorTextApiResourceMapper();
}

class AbilityFlavorTextApiResourceMapper extends ApiResourceMapper<AbilityFlavorTextApiResource> {
  @override
  AbilityFlavorTextApiResource fromUrl(String url) {
    return AbilityFlavorTextApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class VersionGroupFlavorText extends Model<VersionGroupFlavorTextApiModel> {
  static var adapter = VersionGroupFlavorTextAdapter();

  const VersionGroupFlavorText({required super.service, required super.apiModel});

  /// The localized name for an API resource in a specific language.
  String get text => apiModel.text;

  /// The language this name is in.
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);

  /// The version group which uses this flavor text.
  Future<Either<Error, VersionGroup>> get versionGroup => VersionGroup.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.versionGroup);
}

class VersionGroupFlavorTextAdapter extends ApiModelAdapter<VersionGroupFlavorTextApiModel, VersionGroupFlavorText> {
  @override
  VersionGroupFlavorText createModelFromApiModel({required IService service, required VersionGroupFlavorTextApiModel apiModel}) {
    return VersionGroupFlavorText(service: service, apiModel: apiModel);
  }
}

class VersionGroupFlavorTextApiResource extends ApiResource {
  const VersionGroupFlavorTextApiResource({required super.url});

  static get mapper => VersionGroupFlavorTextApiResourceMapper();
}

class VersionGroupFlavorTextApiResourceMapper extends ApiResourceMapper<VersionGroupFlavorTextApiResource> {
  @override
  VersionGroupFlavorTextApiResource fromUrl(String url) {
    return VersionGroupFlavorTextApiResource(url: url);
  }
}

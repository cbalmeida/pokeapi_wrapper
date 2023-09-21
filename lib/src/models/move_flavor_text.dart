import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveFlavorText extends Model<MoveFlavorTextApiModel> {
  static var adapter = MoveFlavorTextAdapter();

  const MoveFlavorText({required super.service, required super.apiModel});

  /// The localized flavor text for an api resource in a specific language.
  String get flavorText => apiModel.flavorText;

  /// The language this name is in.
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);

  /// The version group that uses this flavor text.
  Future<Either<Error, VersionGroup>> get versionGroup => VersionGroup.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.versionGroup);
}

class MoveFlavorTextAdapter extends ApiModelAdapter<MoveFlavorTextApiModel, MoveFlavorText> {
  @override
  MoveFlavorText createModelFromApiModel({required IService service, required MoveFlavorTextApiModel apiModel}) {
    return MoveFlavorText(service: service, apiModel: apiModel);
  }
}

class MoveFlavorTextApiResource extends ApiResource {
  const MoveFlavorTextApiResource({required super.url});

  static get mapper => MoveFlavorTextApiResourceMapper();
}

class MoveFlavorTextApiResourceMapper extends ApiResourceMapper<MoveFlavorTextApiResource> {
  @override
  MoveFlavorTextApiResource fromUrl(String url) {
    return MoveFlavorTextApiResource(url: url);
  }
}

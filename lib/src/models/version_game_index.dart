import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class VersionGameIndex extends Model<VersionGameIndexApiModel> {
  static var adapter = VersionGameIndexAdapter();

  const VersionGameIndex({required super.service, required super.apiModel});

  /// The internal id of an API resource within game data.
  int get gameIndex => apiModel.gameIndex;

  /// The version relevant to this game index.
  Future<Either<Error, Version>> get version => Version.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.version);
}

class VersionGameIndexAdapter extends ApiModelAdapter<VersionGameIndexApiModel, VersionGameIndex> {
  @override
  VersionGameIndex createModelFromApiModel({required IService service, required VersionGameIndexApiModel apiModel}) {
    return VersionGameIndex(service: service, apiModel: apiModel);
  }
}

class VersionGameIndexApiResource extends ApiResource {
  const VersionGameIndexApiResource({required super.url});

  static get mapper => VersionGameIndexApiResourceMapper();
}

class VersionGameIndexApiResourceMapper extends ApiResourceMapper<VersionGameIndexApiResource> {
  @override
  VersionGameIndexApiResource fromUrl(String url) {
    return VersionGameIndexApiResource(url: url);
  }
}

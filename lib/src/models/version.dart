import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Version extends Model<VersionApiModel> {
  static var adapter = VersionAdapter();

  const Version({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// The version group this version belongs to.
  Future<Either<Error, VersionGroup>> get versionGroup => VersionGroup.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.versionGroup);
}

class VersionAdapter extends ApiResourceAdapter<VersionApiModel, Version, VersionApiResource> {
  @override
  Future<Either<Error, VersionApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getVersion(apiResource.url);
  }

  @override
  Version createModelFromApiModel({required IService service, required VersionApiModel apiModel}) {
    return Version(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/version';

  @override
  Future<Either<Error, List<VersionApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getVersionList(offSet: offSet, limit: limit);
  }
}

class VersionApiResource extends ApiResource {
  const VersionApiResource({required super.url});

  static get mapper => VersionApiResourceMapper();
}

class VersionApiResourceMapper extends ApiResourceMapper<VersionApiResource> {
  @override
  VersionApiResource fromUrl(String url) {
    return VersionApiResource(url: url);
  }
}

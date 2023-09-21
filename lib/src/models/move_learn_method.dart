import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveLearnMethod extends Model<MoveLearnMethodApiModel> {
  static var adapter = MoveLearnMethodAdapter();

  const MoveLearnMethod({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The description of this resource listed in different languages.
  List<Description> get descriptions => Description.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.descriptions);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of version groups where moves can be learned through this method.
  Future<Either<Error, List<VersionGroup>>> get versionGroups => VersionGroup.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.versionGroups);
}

class MoveLearnMethodAdapter extends ApiResourceAdapter<MoveLearnMethodApiModel, MoveLearnMethod, MoveLearnMethodApiResource> {
  @override
  Future<Either<Error, MoveLearnMethodApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getMoveLearnMethod(apiResource.url);
  }

  @override
  MoveLearnMethod createModelFromApiModel({required IService service, required MoveLearnMethodApiModel apiModel}) {
    return MoveLearnMethod(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/move-learn-method';

  @override
  Future<Either<Error, List<MoveLearnMethodApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getMoveLearnMethodList(offSet: offSet, limit: limit);
  }
}

class MoveLearnMethodApiResource extends ApiResource {
  const MoveLearnMethodApiResource({required super.url});

  static get mapper => MoveLearnMethodApiResourceMapper();
}

class MoveLearnMethodApiResourceMapper extends ApiResourceMapper<MoveLearnMethodApiResource> {
  @override
  MoveLearnMethodApiResource fromUrl(String url) {
    return MoveLearnMethodApiResource(url: url);
  }
}

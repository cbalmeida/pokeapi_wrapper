import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveTarget extends Model<MoveTargetApiModel> {
  static var adapter = MoveTargetAdapter();

  const MoveTarget({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The description of this resource listed in different languages.
  List<Description> get descriptions => Description.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.descriptions);

  /// A list of moves that that are directed at this target.
  Future<Either<Error, List<Move>>> get moves => Move.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.moves);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class MoveTargetAdapter extends ApiResourceAdapter<MoveTargetApiModel, MoveTarget, MoveTargetApiResource> {
  @override
  Future<Either<Error, MoveTargetApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getMoveTarget(apiResource.url);
  }

  @override
  MoveTarget createModelFromApiModel({required IService service, required MoveTargetApiModel apiModel}) {
    return MoveTarget(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/move-target';

  @override
  Future<Either<Error, List<MoveTargetApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getMoveTargetList(offSet: offSet, limit: limit);
  }
}

class MoveTargetApiResource extends ApiResource {
  const MoveTargetApiResource({required super.url});

  static get mapper => MoveTargetApiResourceMapper();
}

class MoveTargetApiResourceMapper extends ApiResourceMapper<MoveTargetApiResource> {
  @override
  MoveTargetApiResource fromUrl(String url) {
    return MoveTargetApiResource(url: url);
  }
}

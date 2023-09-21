import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveAilment extends Model<MoveAilmentApiModel> {
  static var adapter = MoveAilmentAdapter();

  const MoveAilment({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// A list of moves that cause this ailment.
  Future<Either<Error, List<Move>>> get moves => Move.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.moves);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class MoveAilmentAdapter extends ApiResourceAdapter<MoveAilmentApiModel, MoveAilment, MoveAilmentApiResource> {
  @override
  Future<Either<Error, MoveAilmentApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getMoveAilment(apiResource.url);
  }

  @override
  MoveAilment createModelFromApiModel({required IService service, required MoveAilmentApiModel apiModel}) {
    return MoveAilment(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/move-ailment';

  @override
  Future<Either<Error, List<MoveAilmentApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getMoveAilmentList(offSet: offSet, limit: limit);
  }
}

class MoveAilmentApiResource extends ApiResource {
  const MoveAilmentApiResource({required super.url});

  static get mapper => MoveAilmentApiResourceMapper();
}

class MoveAilmentApiResourceMapper extends ApiResourceMapper<MoveAilmentApiResource> {
  @override
  MoveAilmentApiResource fromUrl(String url) {
    return MoveAilmentApiResource(url: url);
  }
}

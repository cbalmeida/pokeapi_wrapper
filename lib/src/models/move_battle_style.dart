import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveBattleStyle extends Model<MoveBattleStyleApiModel> {
  static var adapter = MoveBattleStyleAdapter();

  const MoveBattleStyle({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class MoveBattleStyleAdapter extends ApiResourceAdapter<MoveBattleStyleApiModel, MoveBattleStyle, MoveBattleStyleApiResource> {
  @override
  Future<Either<Error, MoveBattleStyleApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getMoveBattleStyle(apiResource.url);
  }

  @override
  MoveBattleStyle createModelFromApiModel({required IService service, required MoveBattleStyleApiModel apiModel}) {
    return MoveBattleStyle(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/move-battle-style';

  @override
  Future<Either<Error, List<MoveBattleStyleApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getMoveBattleStyleList(offSet: offSet, limit: limit);
  }
}

class MoveBattleStyleApiResource extends ApiResource {
  const MoveBattleStyleApiResource({required super.url});

  static get mapper => MoveBattleStyleApiResourceMapper();
}

class MoveBattleStyleApiResourceMapper extends ApiResourceMapper<MoveBattleStyleApiResource> {
  @override
  MoveBattleStyleApiResource fromUrl(String url) {
    return MoveBattleStyleApiResource(url: url);
  }
}

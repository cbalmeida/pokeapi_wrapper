import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class SuperContestEffect extends Model<SuperContestEffectApiModel> {
  static var adapter = SuperContestEffectAdapter();

  const SuperContestEffect({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The level of appeal this super contest effect has.
  int get appeal => apiModel.appeal;

  /// The flavor text of this super contest effect listed in different languages.
  List<FlavorText> get flavorTextEntries => FlavorText.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.flavorTextEntries);

  /// A list of moves that have the effect when used in super contests.
  Future<Either<Error, List<Move>>> get moves => Move.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.moves);
}

class SuperContestEffectAdapter extends ApiResourceAdapter<SuperContestEffectApiModel, SuperContestEffect, SuperContestEffectApiResource> {
  @override
  Future<Either<Error, SuperContestEffectApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getSuperContestEffect(apiResource.url);
  }

  @override
  SuperContestEffect createModelFromApiModel({required IService service, required SuperContestEffectApiModel apiModel}) {
    return SuperContestEffect(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/super-contest-effect';

  @override
  Future<Either<Error, List<SuperContestEffectApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getSuperContestEffectList(offSet: offSet, limit: limit);
  }
}

class SuperContestEffectApiResource extends ApiResource {
  const SuperContestEffectApiResource({required super.url});

  static get mapper => SuperContestEffectApiResourceMapper();
}

class SuperContestEffectApiResourceMapper extends ApiResourceMapper<SuperContestEffectApiResource> {
  @override
  SuperContestEffectApiResource fromUrl(String url) {
    return SuperContestEffectApiResource(url: url);
  }
}

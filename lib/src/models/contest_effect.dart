import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ContestEffect extends Model<ContestEffectApiModel> {
  static var adapter = ContestEffectAdapter();

  const ContestEffect({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The base number of hearts the user of this move gets.
  int get appeal => apiModel.appeal;

  /// The base number of hearts the user's opponent loses.
  int get jam => apiModel.jam;

  /// The result of this contest effect listed in different languages.
  List<Effect> get effectEntries => Effect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.effectEntries);

  /// The flavor text of this contest effect listed in different languages.
  List<FlavorText> get flavorTextEntries => FlavorText.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.flavorTextEntries);
}

class ContestEffectAdapter extends ApiResourceAdapter<ContestEffectApiModel, ContestEffect, ContestEffectApiResource> {
  @override
  Future<Either<Error, ContestEffectApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getContestEffect(apiResource.url);
  }

  @override
  ContestEffect createModelFromApiModel({required IService service, required ContestEffectApiModel apiModel}) {
    return ContestEffect(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/contest-effect';

  @override
  Future<Either<Error, List<ContestEffectApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getContestEffectList(offSet: offSet, limit: limit);
  }
}

class ContestEffectApiResource extends ApiResource {
  const ContestEffectApiResource({required super.url});

  static get mapper => ContestEffectApiResourceMapper();
}

class ContestEffectApiResourceMapper extends ApiResourceMapper<ContestEffectApiResource> {
  @override
  ContestEffectApiResource fromUrl(String url) {
    return ContestEffectApiResource(url: url);
  }
}

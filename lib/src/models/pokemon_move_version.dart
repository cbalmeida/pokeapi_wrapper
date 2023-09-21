import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonMoveVersion extends Model<PokemonMoveVersionApiModel> {
  static var adapter = PokemonMoveVersionAdapter();

  const PokemonMoveVersion({required super.service, required super.apiModel});

  /// The method by which the move is learned.
  Future<Either<Error, MoveLearnMethod>> get moveLearnMethod => MoveLearnMethod.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.moveLearnMethod);

  /// The version group in which the move is learned.
  Future<Either<Error, VersionGroup>> get versionGroup => VersionGroup.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.versionGroup);

  /// The minimum level to learn the move.
  int get levelLearnedAt => apiModel.levelLearnedAt;
}

class PokemonMoveVersionAdapter extends ApiModelAdapter<PokemonMoveVersionApiModel, PokemonMoveVersion> {
  @override
  PokemonMoveVersion createModelFromApiModel({required IService service, required PokemonMoveVersionApiModel apiModel}) {
    return PokemonMoveVersion(service: service, apiModel: apiModel);
  }
}

class PokemonMoveVersionApiResource extends ApiResource {
  const PokemonMoveVersionApiResource({required super.url});

  static get mapper => PokemonMoveVersionApiResourceMapper();
}

class PokemonMoveVersionApiResourceMapper extends ApiResourceMapper<PokemonMoveVersionApiResource> {
  @override
  PokemonMoveVersionApiResource fromUrl(String url) {
    return PokemonMoveVersionApiResource(url: url);
  }
}

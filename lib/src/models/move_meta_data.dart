import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveMetaData extends Model<MoveMetaDataApiModel> {
  static var adapter = MoveMetaDataAdapter();

  const MoveMetaData({required super.service, required super.apiModel});

  /// The status ailment this move inflicts on its target.
  Future<Either<Error, MoveAilment>> get ailment => MoveAilment.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.ailment);

  /// The category of move this move falls under, e.g. damage or ailment.
  Future<Either<Error, MoveCategory>> get category => MoveCategory.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.category);

  /// The minimum number of times this move hits. -1 if it always only hits once.
  int get minHits => apiModel.minHits;

  /// The maximum number of times this move hits. -1 if it always only hits once.
  int get maxHits => apiModel.maxHits;

  /// The minimum number of turns this move continues to take effect. -1 if it always only lasts one turn.
  int get minTurns => apiModel.minTurns;

  /// The maximum number of turns this move continues to take effect. -1 if it always only lasts one turn.
  int get maxTurns => apiModel.maxTurns;

  /// HP drain (if positive) or Recoil damage (if negative), in percent of damage done.
  int get drain => apiModel.drain;

  /// The amount of hp gained by the attacking Pokemon, in percent of it's maximum HP.
  int get healing => apiModel.healing;

  /// Critical hit rate bonus.
  int get critRate => apiModel.critRate;

  /// The likelihood this attack will cause an ailment.
  int get ailmentChance => apiModel.ailmentChance;

  /// The likelihood this attack will cause the target Pokémon to flinch.
  int get flinchChance => apiModel.flinchChance;

  /// The likelihood this attack will cause a stat change in the target Pokémon.
  int get statChance => apiModel.statChance;
}

class MoveMetaDataAdapter extends ApiModelAdapter<MoveMetaDataApiModel, MoveMetaData> {
  @override
  MoveMetaData createModelFromApiModel({required IService service, required MoveMetaDataApiModel apiModel}) {
    return MoveMetaData(service: service, apiModel: apiModel);
  }
}

class MoveMetaDataApiResource extends ApiResource {
  const MoveMetaDataApiResource({required super.url});

  static get mapper => MoveMetaDataApiResourceMapper();
}

class MoveMetaDataApiResourceMapper extends ApiResourceMapper<MoveMetaDataApiResource> {
  @override
  MoveMetaDataApiResource fromUrl(String url) {
    return MoveMetaDataApiResource(url: url);
  }
}

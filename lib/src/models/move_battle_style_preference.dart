import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveBattleStylePreference extends Model<MoveBattleStylePreferenceApiModel> {
  static var adapter = MoveBattleStylePreferenceAdapter();

  const MoveBattleStylePreference({required super.service, required super.apiModel});

  /// Chance of using the move, in percent, if HP is under one half.
  int get lowHpPreference => apiModel.lowHpPreference;

  /// Chance of using the move, in percent, if HP is over one half.
  int get highHpPreference => apiModel.highHpPreference;

  /// The move battle style.
  Future<Either<Error, MoveBattleStyle>> get moveBattleStyle => MoveBattleStyle.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.moveBattleStyle);
}

class MoveBattleStylePreferenceAdapter extends ApiModelAdapter<MoveBattleStylePreferenceApiModel, MoveBattleStylePreference> {
  @override
  MoveBattleStylePreference createModelFromApiModel({required IService service, required MoveBattleStylePreferenceApiModel apiModel}) {
    return MoveBattleStylePreference(service: service, apiModel: apiModel);
  }
}

class MoveBattleStylePreferenceApiResource extends ApiResource {
  const MoveBattleStylePreferenceApiResource({required super.url});

  static get mapper => MoveBattleStylePreferenceApiResourceMapper();
}

class MoveBattleStylePreferenceApiResourceMapper extends ApiResourceMapper<MoveBattleStylePreferenceApiResource> {
  @override
  MoveBattleStylePreferenceApiResource fromUrl(String url) {
    return MoveBattleStylePreferenceApiResource(url: url);
  }
}

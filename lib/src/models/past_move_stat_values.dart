import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PastMoveStatValues extends Model<PastMoveStatValuesApiModel> {
  static var adapter = PastMoveStatValuesAdapter();

  const PastMoveStatValues({required super.service, required super.apiModel});

  /// The percent value of how likely this move is to be successful
  int get accuracy => apiModel.accuracy;

  /// The percent value of how likely it is this moves effect will take effect
  int get effectChance => apiModel.effectChance;

  /// The base power of this move with a value of 0 if it does not have a base power
  int get power => apiModel.power;

  /// Power points. The number of times this move can be used
  int get pp => apiModel.pp;

  /// The effect of this move listed in different languages
  List<VerboseEffect> get effectEntries => VerboseEffect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.effectEntries);

  /// The elemental type of this move
  Future<Either<Error, Type>> get type => Type.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.type);

  /// The version group in which these move stat values were in effect
  Future<Either<Error, VersionGroup>> get versionGroup => VersionGroup.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.versionGroup);
}

class PastMoveStatValuesAdapter extends ApiModelAdapter<PastMoveStatValuesApiModel, PastMoveStatValues> {
  @override
  PastMoveStatValues createModelFromApiModel({required IService service, required PastMoveStatValuesApiModel apiModel}) {
    return PastMoveStatValues(service: service, apiModel: apiModel);
  }
}

class PastMoveStatValuesApiResource extends ApiResource {
  const PastMoveStatValuesApiResource({required super.url});

  static get mapper => PastMoveStatValuesApiResourceMapper();
}

class PastMoveStatValuesApiResourceMapper extends ApiResourceMapper<PastMoveStatValuesApiResource> {
  @override
  PastMoveStatValuesApiResource fromUrl(String url) {
    return PastMoveStatValuesApiResource(url: url);
  }
}

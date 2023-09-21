import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Stat extends Model<StatApiModel> {
  static var adapter = StatAdapter();

  const Stat({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// ID the games use for this stat.
  int get gameIndex => apiModel.gameIndex;

  /// Whether this stat only exists within a battle.
  bool get isBattleOnly => apiModel.isBattleOnly;

  /// A detail of moves which affect this stat positively or negatively.
  MoveStatAffectSets get affectingMoves => MoveStatAffectSets.adapter.createModelFromApiModel(service: service, apiModel: apiModel.affectingMoves);

  /// A detail of natures which affect this stat positively or negatively.
  NatureStatAffectSets get affectingNatures => NatureStatAffectSets.adapter.createModelFromApiModel(service: service, apiModel: apiModel.affectingNatures);

  /// A list of characteristics that are set on a Pokémon when its highest base stat is this stat.
  Future<Either<Error, List<Characteristic>>> get characteristics => Characteristic.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.characteristics);

  /// The class of damage this stat is directly related to.
  Future<Either<Error, MoveDamageClass>> get moveDamageClass => MoveDamageClass.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.moveDamageClass);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class StatAdapter extends ApiResourceAdapter<StatApiModel, Stat, StatApiResource> {
  @override
  Future<Either<Error, StatApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getStat(apiResource.url);
  }

  @override
  Stat createModelFromApiModel({required IService service, required StatApiModel apiModel}) {
    return Stat(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/stat';

  @override
  Future<Either<Error, List<StatApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getStatList(offSet: offSet, limit: limit);
  }
}

class StatApiResource extends ApiResource {
  const StatApiResource({required super.url});

  static get mapper => StatApiResourceMapper();
}

class StatApiResourceMapper extends ApiResourceMapper<StatApiResource> {
  @override
  StatApiResource fromUrl(String url) {
    return StatApiResource(url: url);
  }
}

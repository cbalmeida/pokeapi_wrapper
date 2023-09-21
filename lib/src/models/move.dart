import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Move extends Model<MoveApiModel> {
  static var adapter = MoveAdapter();

  const Move({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The percent value of how likely this move is to be successful.
  int get accuracy => apiModel.accuracy;

  /// The percent value of how likely it is this moves effect will happen.
  int get effectChance => apiModel.effectChance;

  /// Power points. The number of times this move can be used.
  int get pp => apiModel.pp;

  /// A value between -8 and 8. Sets the order in which moves are executed during battle. See Bulbapedia for greater detail.
  int get priority => apiModel.priority;

  /// The base power of this move with a value of 0 if it does not have a base power.
  int get power => apiModel.power;

  /// A detail of normal and super contest combos that require this move.
  ContestComboSets get contestCombos => ContestComboSets.adapter.createModelFromApiModel(service: service, apiModel: apiModel.contestCombos);

  /// The type of appeal this move gives a Pokémon when used in a contest.
  Future<Either<Error, ContestType>> get contestType => ContestType.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.contestType);

  /// The effect the move has when used in a contest.
  Future<Either<Error, ContestEffect>> get contestEffect => ContestEffect.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.contestEffect);

  /// The type of damage the move inflicts on the target, e.g. physical.
  Future<Either<Error, MoveDamageClass>> get damageClass => MoveDamageClass.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.damageClass);

  /// The effect of this move listed in different languages.
  List<VerboseEffect> get effectEntries => VerboseEffect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.effectEntries);

  /// The list of previous effects this move has had across version groups of the games.
  List<AbilityEffectChange> get effectChanges => AbilityEffectChange.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.effectChanges);

  /// List of Pokemon that can learn the move
  Future<Either<Error, List<Pokemon>>> get learnedByPokemon => Pokemon.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.learnedByPokemon);

  /// The flavor text of this move listed in different languages.
  List<MoveFlavorText> get flavorTextEntries => MoveFlavorText.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.flavorTextEntries);

  /// The generation in which this move was introduced.
  Future<Either<Error, Generation>> get generation => Generation.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.generation);

  /// A list of the machines that teach this move.
  List<MachineVersionDetail> get machines => MachineVersionDetail.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.machines);

  /// Metadata about this move
  MoveMetaData get meta => MoveMetaData.adapter.createModelFromApiModel(service: service, apiModel: apiModel.meta);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of move resource value changes across version groups of the game.
  List<PastMoveStatValues> get pastValues => PastMoveStatValues.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pastValues);

  /// A list of stats this moves effects and how much it effects them.
  List<MoveStatChange> get statChanges => MoveStatChange.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.statChanges);

  /// The effect the move has when used in a super contest.
  Future<Either<Error, SuperContestEffect>> get superContestEffect => SuperContestEffect.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.superContestEffect);

  /// The type of target that will receive the effects of the attack.
  Future<Either<Error, MoveTarget>> get target => MoveTarget.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.target);

  /// The elemental type of this move.
  Future<Either<Error, Type>> get type => Type.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.type);
}

class MoveAdapter extends ApiResourceAdapter<MoveApiModel, Move, MoveApiResource> {
  @override
  Future<Either<Error, MoveApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getMove(apiResource.url);
  }

  @override
  Move createModelFromApiModel({required IService service, required MoveApiModel apiModel}) {
    return Move(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/move';

  @override
  Future<Either<Error, List<MoveApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getMoveList(offSet: offSet, limit: limit);
  }
}

class MoveApiResource extends ApiResource {
  const MoveApiResource({required super.url});

  static get mapper => MoveApiResourceMapper();
}

class MoveApiResourceMapper extends ApiResourceMapper<MoveApiResource> {
  @override
  MoveApiResource fromUrl(String url) {
    return MoveApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class EvolutionDetail extends Model<EvolutionDetailApiModel> {
  static var adapter = EvolutionDetailAdapter();

  const EvolutionDetail({required super.service, required super.apiModel});

  /// The item required to cause evolution this into Pokémon species.
  Future<Either<Error, Item>> get item => Item.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.item);

  /// The type of event that triggers evolution into this Pokémon species.
  Future<Either<Error, EvolutionTrigger>> get trigger => EvolutionTrigger.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.trigger);

  /// The id of the gender of the evolving Pokémon species must be in order to evolve into this Pokémon species.
  int get gender => apiModel.gender;

  /// The item the evolving Pokémon species must be holding during the evolution trigger event to evolve into this Pokémon species.
  Future<Either<Error, Item>> get heldItem => Item.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.heldItem);

  /// The move that must be known by the evolving Pokémon species during the evolution trigger event in order to evolve into this Pokémon species.
  Future<Either<Error, Move>> get knownMove => Move.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.knownMove);

  /// The evolving Pokémon species must know a move with this type during the evolution trigger event in order to evolve into this Pokémon species.
  Future<Either<Error, Type>> get knownMoveType => Type.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.knownMoveType);

  /// The location the evolution must be triggered at.
  Future<Either<Error, Location>> get location => Location.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.location);

  /// The minimum required level of the evolving Pokémon species to evolve into this Pokémon species.
  int get minLevel => apiModel.minLevel;

  /// The minimum required level of happiness the evolving Pokémon species to evolve into this Pokémon species.
  int get minHappiness => apiModel.minHappiness;

  /// The minimum required level of beauty the evolving Pokémon species to evolve into this Pokémon species.
  int get minBeauty => apiModel.minBeauty;

  /// The minimum required level of affection the evolving Pokémon species to evolve into this Pokémon species.
  int get minAffection => apiModel.minAffection;

  /// Whether or not it must be raining in the overworld to cause evolution this Pokémon species.
  bool get needsOverworldRain => apiModel.needsOverworldRain;

  /// The Pokémon species that must be in the players party in order for the evolving Pokémon species to evolve into this Pokémon species.
  Future<Either<Error, PokemonSpecies>> get partySpecies => PokemonSpecies.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.partySpecies);

  /// The player must have a Pokémon of this type in their party during the evolution trigger event in order for the evolving Pokémon species to evolve into this Pokémon species.
  Future<Either<Error, Type>> get partyType => Type.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.partyType);

  /// The required relation between the Pokémon's Attack and Defense stats. 1 means Attack > Defense. 0 means Attack = Defense. -1 means Attack < Defense.
  int get relativePhysicalStats => apiModel.relativePhysicalStats;

  /// The required time of day. Day or night.
  String get timeOfDay => apiModel.timeOfDay;

  /// Pokémon species for which this one must be traded.
  Future<Either<Error, PokemonSpecies>> get tradeSpecies => PokemonSpecies.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.tradeSpecies);

  /// Whether or not the 3DS needs to be turned upside-down as this Pokémon levels up.
  bool get turnUpsideDown => apiModel.turnUpsideDown;
}

class EvolutionDetailAdapter extends ApiModelAdapter<EvolutionDetailApiModel, EvolutionDetail> {
  @override
  EvolutionDetail createModelFromApiModel({required IService service, required EvolutionDetailApiModel apiModel}) {
    return EvolutionDetail(service: service, apiModel: apiModel);
  }
}

class EvolutionDetailApiResource extends ApiResource {
  const EvolutionDetailApiResource({required super.url});

  static get mapper => EvolutionDetailApiResourceMapper();
}

class EvolutionDetailApiResourceMapper extends ApiResourceMapper<EvolutionDetailApiResource> {
  @override
  EvolutionDetailApiResource fromUrl(String url) {
    return EvolutionDetailApiResource(url: url);
  }
}

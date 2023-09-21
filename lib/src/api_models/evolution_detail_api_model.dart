import '../../pokeapi_wrapper.dart';

class EvolutionDetailApiModel extends ApiModel {
  static var mapper = EvolutionDetailApiModelMapper();

  final ItemApiResource item;

  final EvolutionTriggerApiResource trigger;

  final int gender;

  final ItemApiResource heldItem;

  final MoveApiResource knownMove;

  final TypeApiResource knownMoveType;

  final LocationApiResource location;

  final int minLevel;

  final int minHappiness;

  final int minBeauty;

  final int minAffection;

  final bool needsOverworldRain;

  final PokemonSpeciesApiResource partySpecies;

  final TypeApiResource partyType;

  final int relativePhysicalStats;

  final String timeOfDay;

  final PokemonSpeciesApiResource tradeSpecies;

  final bool turnUpsideDown;

  const EvolutionDetailApiModel({
    required this.item,
    required this.trigger,
    required this.gender,
    required this.heldItem,
    required this.knownMove,
    required this.knownMoveType,
    required this.location,
    required this.minLevel,
    required this.minHappiness,
    required this.minBeauty,
    required this.minAffection,
    required this.needsOverworldRain,
    required this.partySpecies,
    required this.partyType,
    required this.relativePhysicalStats,
    required this.timeOfDay,
    required this.tradeSpecies,
    required this.turnUpsideDown,
  });
}

class EvolutionDetailApiModelMapper extends Mapper<EvolutionDetailApiModel> {
  @override
  EvolutionDetailApiModel fromMap(Map<String, dynamic>? map) {
    return EvolutionDetailApiModel(
      item: ItemApiResource.mapper.fromMap(map?['item']),
      trigger: EvolutionTriggerApiResource.mapper.fromMap(map?['trigger']),
      gender: map?['gender'] ?? 0,
      heldItem: ItemApiResource.mapper.fromMap(map?['held_item']),
      knownMove: MoveApiResource.mapper.fromMap(map?['known_move']),
      knownMoveType: TypeApiResource.mapper.fromMap(map?['known_move_type']),
      location: LocationApiResource.mapper.fromMap(map?['location']),
      minLevel: map?['min_level'] ?? 0,
      minHappiness: map?['min_happiness'] ?? 0,
      minBeauty: map?['min_beauty'] ?? 0,
      minAffection: map?['min_affection'] ?? 0,
      needsOverworldRain: map?['needs_overworld_rain'] ?? false,
      partySpecies: PokemonSpeciesApiResource.mapper.fromMap(map?['party_species']),
      partyType: TypeApiResource.mapper.fromMap(map?['party_type']),
      relativePhysicalStats: map?['relative_physical_stats'] ?? 0,
      timeOfDay: map?['time_of_day'] ?? '',
      tradeSpecies: PokemonSpeciesApiResource.mapper.fromMap(map?['trade_species']),
      turnUpsideDown: map?['turn_upside_down'] ?? false,
    );
  }

  @override
  Map<String, dynamic> toMap(EvolutionDetailApiModel value) {
    return {
      'item': ItemApiResource.mapper.toMap(value.item),
      'trigger': EvolutionTriggerApiResource.mapper.toMap(value.trigger),
      'gender': value.gender,
      'held_item': ItemApiResource.mapper.toMap(value.heldItem),
      'known_move': MoveApiResource.mapper.toMap(value.knownMove),
      'known_move_type': TypeApiResource.mapper.toMap(value.knownMoveType),
      'location': LocationApiResource.mapper.toMap(value.location),
      'min_level': value.minLevel,
      'min_happiness': value.minHappiness,
      'min_beauty': value.minBeauty,
      'min_affection': value.minAffection,
      'needs_overworld_rain': value.needsOverworldRain,
      'party_species': PokemonSpeciesApiResource.mapper.toMap(value.partySpecies),
      'party_type': TypeApiResource.mapper.toMap(value.partyType),
      'relative_physical_stats': value.relativePhysicalStats,
      'time_of_day': value.timeOfDay,
      'trade_species': PokemonSpeciesApiResource.mapper.toMap(value.tradeSpecies),
      'turn_upside_down': value.turnUpsideDown,
    };
  }
}

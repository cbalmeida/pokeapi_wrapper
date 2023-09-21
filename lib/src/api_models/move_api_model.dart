import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class MoveApiModel extends ApiModel {
  static var mapper = MoveApiModelMapper();

  final int id;

  final String name;

  final int accuracy;

  final int effectChance;

  final int pp;

  final int priority;

  final int power;

  final ContestComboSetsApiModel contestCombos;

  final ContestTypeApiResource contestType;

  final ContestEffectApiResource contestEffect;

  final MoveDamageClassApiResource damageClass;

  final List<VerboseEffectApiModel> effectEntries;

  final List<AbilityEffectChangeApiModel> effectChanges;

  final List<PokemonApiResource> learnedByPokemon;

  final List<MoveFlavorTextApiModel> flavorTextEntries;

  final GenerationApiResource generation;

  final List<MachineVersionDetailApiModel> machines;

  final MoveMetaDataApiModel meta;

  final List<NameApiModel> names;

  final List<PastMoveStatValuesApiModel> pastValues;

  final List<MoveStatChangeApiModel> statChanges;

  final SuperContestEffectApiResource superContestEffect;

  final MoveTargetApiResource target;

  final TypeApiResource type;

  const MoveApiModel({
    required this.id,
    required this.name,
    required this.accuracy,
    required this.effectChance,
    required this.pp,
    required this.priority,
    required this.power,
    required this.contestCombos,
    required this.contestType,
    required this.contestEffect,
    required this.damageClass,
    required this.effectEntries,
    required this.effectChanges,
    required this.learnedByPokemon,
    required this.flavorTextEntries,
    required this.generation,
    required this.machines,
    required this.meta,
    required this.names,
    required this.pastValues,
    required this.statChanges,
    required this.superContestEffect,
    required this.target,
    required this.type,
  });
}

class MoveApiModelMapper extends Mapper<MoveApiModel> {
  @override
  MoveApiModel fromMap(Map<String, dynamic>? map) {
    return MoveApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      accuracy: map?['accuracy'] ?? 0,
      effectChance: map?['effect_chance'] ?? 0,
      pp: map?['pp'] ?? 0,
      priority: map?['priority'] ?? 0,
      power: map?['power'] ?? 0,
      contestCombos: ContestComboSetsApiModel.mapper.fromMap(map?['contest_combos']),
      contestType: ContestTypeApiResource.mapper.fromMap(map?['contest_type']),
      contestEffect: ContestEffectApiResource.mapper.fromMap(map?['contest_effect']),
      damageClass: MoveDamageClassApiResource.mapper.fromMap(map?['damage_class']),
      effectEntries: VerboseEffectApiModel.mapper.fromList(map?['effect_entries']),
      effectChanges: AbilityEffectChangeApiModel.mapper.fromList(map?['effect_changes']),
      learnedByPokemon: PokemonApiResource.mapper.fromList(map?['learned_by_pokemon']),
      flavorTextEntries: MoveFlavorTextApiModel.mapper.fromList(map?['flavor_text_entries']),
      generation: GenerationApiResource.mapper.fromMap(map?['generation']),
      machines: MachineVersionDetailApiModel.mapper.fromList(map?['machines']),
      meta: MoveMetaDataApiModel.mapper.fromMap(map?['meta']),
      names: NameApiModel.mapper.fromList(map?['names']),
      pastValues: PastMoveStatValuesApiModel.mapper.fromList(map?['past_values']),
      statChanges: MoveStatChangeApiModel.mapper.fromList(map?['stat_changes']),
      superContestEffect: SuperContestEffectApiResource.mapper.fromMap(map?['super_contest_effect']),
      target: MoveTargetApiResource.mapper.fromMap(map?['target']),
      type: TypeApiResource.mapper.fromMap(map?['type']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'accuracy': value.accuracy,
      'effect_chance': value.effectChance,
      'pp': value.pp,
      'priority': value.priority,
      'power': value.power,
      'contest_combos': ContestComboSetsApiModel.mapper.toMap(value.contestCombos),
      'contest_type': ContestTypeApiResource.mapper.toMap(value.contestType),
      'contest_effect': ContestEffectApiResource.mapper.toMap(value.contestEffect),
      'damage_class': MoveDamageClassApiResource.mapper.toMap(value.damageClass),
      'effect_entries': VerboseEffectApiModel.mapper.toList(value.effectEntries),
      'effect_changes': AbilityEffectChangeApiModel.mapper.toList(value.effectChanges),
      'learned_by_pokemon': PokemonApiResource.mapper.toList(value.learnedByPokemon),
      'flavor_text_entries': MoveFlavorTextApiModel.mapper.toList(value.flavorTextEntries),
      'generation': GenerationApiResource.mapper.toMap(value.generation),
      'machines': MachineVersionDetailApiModel.mapper.toList(value.machines),
      'meta': MoveMetaDataApiModel.mapper.toMap(value.meta),
      'names': NameApiModel.mapper.toList(value.names),
      'past_values': PastMoveStatValuesApiModel.mapper.toList(value.pastValues),
      'stat_changes': MoveStatChangeApiModel.mapper.toList(value.statChanges),
      'super_contest_effect': SuperContestEffectApiResource.mapper.toMap(value.superContestEffect),
      'target': MoveTargetApiResource.mapper.toMap(value.target),
      'type': TypeApiResource.mapper.toMap(value.type),
    };
  }
}

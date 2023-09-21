import '../../pokeapi_wrapper.dart';

class MoveMetaDataApiModel extends ApiModel {
  static var mapper = MoveMetaDataApiModelMapper();

  final MoveAilmentApiResource ailment;

  final MoveCategoryApiResource category;

  final int minHits;

  final int maxHits;

  final int minTurns;

  final int maxTurns;

  final int drain;

  final int healing;

  final int critRate;

  final int ailmentChance;

  final int flinchChance;

  final int statChance;

  const MoveMetaDataApiModel({
    required this.ailment,
    required this.category,
    required this.minHits,
    required this.maxHits,
    required this.minTurns,
    required this.maxTurns,
    required this.drain,
    required this.healing,
    required this.critRate,
    required this.ailmentChance,
    required this.flinchChance,
    required this.statChance,
  });
}

class MoveMetaDataApiModelMapper extends Mapper<MoveMetaDataApiModel> {
  @override
  MoveMetaDataApiModel fromMap(Map<String, dynamic>? map) {
    return MoveMetaDataApiModel(
      ailment: MoveAilmentApiResource.mapper.fromMap(map?['ailment']),
      category: MoveCategoryApiResource.mapper.fromMap(map?['category']),
      minHits: map?['min_hits'] ?? -1,
      maxHits: map?['max_hits'] ?? -1,
      minTurns: map?['min_turns'] ?? -1,
      maxTurns: map?['max_turns'] ?? -1,
      drain: map?['drain'] ?? 0,
      healing: map?['healing'] ?? 0,
      critRate: map?['crit_rate'] ?? 0,
      ailmentChance: map?['ailment_chance'] ?? 0,
      flinchChance: map?['flinch_chance'] ?? 0,
      statChance: map?['stat_chance'] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toMap(MoveMetaDataApiModel value) {
    return {
      'ailment': MoveAilmentApiResource.mapper.toMap(value.ailment),
      'category': MoveCategoryApiResource.mapper.toMap(value.category),
      'min_hits': value.minHits,
      'max_hits': value.maxHits,
      'min_turns': value.minTurns,
      'max_turns': value.maxTurns,
      'drain': value.drain,
      'healing': value.healing,
      'crit_rate': value.critRate,
      'ailment_chance': value.ailmentChance,
      'flinch_chance': value.flinchChance,
      'stat_chance': value.statChance,
    };
  }
}

import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class PastMoveStatValuesApiModel extends ApiModel {
  static var mapper = PastMoveStatValuesApiModelMapper();

  final int accuracy;

  final int effectChance;

  final int power;

  final int pp;

  final List<VerboseEffectApiModel> effectEntries;

  final TypeApiResource type;

  final VersionGroupApiResource versionGroup;

  const PastMoveStatValuesApiModel({
    required this.accuracy,
    required this.effectChance,
    required this.power,
    required this.pp,
    required this.effectEntries,
    required this.type,
    required this.versionGroup,
  });
}

class PastMoveStatValuesApiModelMapper extends Mapper<PastMoveStatValuesApiModel> {
  @override
  PastMoveStatValuesApiModel fromMap(Map<String, dynamic>? map) {
    return PastMoveStatValuesApiModel(
      accuracy: map?['accuracy'] ?? 0,
      effectChance: map?['effect_chance'] ?? 0,
      power: map?['power'] ?? 0,
      pp: map?['pp'] ?? 0,
      effectEntries: VerboseEffectApiModel.mapper.fromList(map?['effect_entries']),
      type: TypeApiResource.mapper.fromMap(map?['type']),
      versionGroup: VersionGroupApiResource.mapper.fromMap(map?['version_group']),
    );
  }

  @override
  Map<String, dynamic> toMap(PastMoveStatValuesApiModel value) {
    return {
      'accuracy': value.accuracy,
      'effect_chance': value.effectChance,
      'power': value.power,
      'pp': value.pp,
      'effect_entries': VerboseEffectApiModel.mapper.toList(value.effectEntries),
      'type': TypeApiResource.mapper.toMap(value.type),
      'version_group': VersionGroupApiResource.mapper.toMap(value.versionGroup),
    };
  }
}

import '../../pokeapi_wrapper.dart';

class EncounterApiModel extends ApiModel {
  static var mapper = EncounterApiModelMapper();

  final int minLevel;

  final int maxLevel;

  final List<EncounterConditionValueApiResource> conditionValues;

  final int chance;

  final EncounterMethodApiResource method;

  const EncounterApiModel({
    required this.minLevel,
    required this.maxLevel,
    required this.conditionValues,
    required this.chance,
    required this.method,
  });
}

class EncounterApiModelMapper extends Mapper<EncounterApiModel> {
  @override
  EncounterApiModel fromMap(Map<String, dynamic>? map) {
    return EncounterApiModel(
      minLevel: map?['min_level'] ?? 0,
      maxLevel: map?['max_level'] ?? 0,
      conditionValues: EncounterConditionValueApiResource.mapper.fromList(map?['condition_values']),
      chance: map?['chance'] ?? 0,
      method: EncounterMethodApiResource.mapper.fromMap(map?['method']),
    );
  }

  @override
  Map<String, dynamic> toMap(EncounterApiModel value) {
    return {
      'min_level': value.minLevel,
      'max_level': value.maxLevel,
      'condition_values': EncounterConditionValueApiResource.mapper.toList(value.conditionValues),
      'chance': value.chance,
      'method': EncounterMethodApiResource.mapper.toMap(value.method),
    };
  }
}

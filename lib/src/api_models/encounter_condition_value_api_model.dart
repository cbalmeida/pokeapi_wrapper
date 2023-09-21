import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class EncounterConditionValueApiModel {
  static var mapper = EncounterConditionValueApiModelMapper();

  final int id;

  final String name;

  final EncounterConditionApiResource condition;

  final List<NameApiModel> names;

  const EncounterConditionValueApiModel({
    required this.id,
    required this.name,
    required this.condition,
    required this.names,
  });
}

class EncounterConditionValueApiModelMapper extends Mapper<EncounterConditionValueApiModel> {
  @override
  EncounterConditionValueApiModel fromMap(Map<String, dynamic>? map) {
    return EncounterConditionValueApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      condition: EncounterConditionApiResource.mapper.fromMap(map?['condition']),
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(EncounterConditionValueApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'condition': EncounterConditionApiResource.mapper.toMap(value.condition),
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

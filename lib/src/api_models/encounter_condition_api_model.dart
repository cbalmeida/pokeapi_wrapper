import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class EncounterConditionApiModel extends ApiModel {
  static var mapper = EncounterConditionApiModelMapper();

  final int id;

  final String name;

  final List<NameApiModel> names;

  final List<EncounterConditionValueApiResource> values;

  const EncounterConditionApiModel({
    required this.id,
    required this.name,
    required this.names,
    required this.values,
  });
}

class EncounterConditionApiModelMapper extends Mapper<EncounterConditionApiModel> {
  @override
  EncounterConditionApiModel fromMap(Map<String, dynamic>? map) {
    return EncounterConditionApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      names: NameApiModel.mapper.fromList(map?['names']),
      values: EncounterConditionValueApiResource.mapper.fromList(map?['values']),
    );
  }

  @override
  Map<String, dynamic> toMap(EncounterConditionApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'names': NameApiModel.mapper.toList(value.names),
      'values': EncounterConditionValueApiResource.mapper.toList(value.values),
    };
  }
}

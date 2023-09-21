import '../api_models.dart';
import '../core.dart';

class EncounterMethodApiModel extends ApiModel {
  static var mapper = EncounterMethodApiModelMapper();

  final int id;

  final String name;

  final int order;

  final List<NameApiModel> names;

  const EncounterMethodApiModel({
    required this.id,
    required this.name,
    required this.order,
    required this.names,
  });
}

class EncounterMethodApiModelMapper extends Mapper<EncounterMethodApiModel> {
  @override
  EncounterMethodApiModel fromMap(Map<String, dynamic>? map) {
    return EncounterMethodApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      order: map?['order'] ?? 0,
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(EncounterMethodApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'order': value.order,
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class MoveTargetApiModel extends ApiModel {
  static var mapper = MoveTargetApiModelMapper();

  final int id;

  final String name;

  final List<DescriptionApiModel> descriptions;

  final List<MoveApiResource> moves;

  final List<NameApiModel> names;

  const MoveTargetApiModel({
    required this.id,
    required this.name,
    required this.descriptions,
    required this.moves,
    required this.names,
  });
}

class MoveTargetApiModelMapper extends Mapper<MoveTargetApiModel> {
  @override
  MoveTargetApiModel fromMap(Map<String, dynamic>? map) {
    return MoveTargetApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      descriptions: DescriptionApiModel.mapper.fromList(map?['descriptions']),
      moves: MoveApiResource.mapper.fromList(map?['moves']),
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveTargetApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'descriptions': DescriptionApiModel.mapper.toList(value.descriptions),
      'moves': MoveApiResource.mapper.toList(value.moves),
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

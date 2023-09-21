import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class MoveDamageClassApiModel extends ApiModel {
  static var mapper = MoveDamageClassApiModelMapper();

  final int id;

  final String name;

  final List<DescriptionApiModel> descriptions;

  final List<MoveApiResource> moves;

  final List<NameApiModel> names;

  const MoveDamageClassApiModel({
    required this.id,
    required this.name,
    required this.descriptions,
    required this.moves,
    required this.names,
  });
}

class MoveDamageClassApiModelMapper extends Mapper<MoveDamageClassApiModel> {
  @override
  MoveDamageClassApiModel fromMap(Map<String, dynamic>? map) {
    return MoveDamageClassApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      descriptions: DescriptionApiModel.mapper.fromList(map?['descriptions']),
      moves: MoveApiResource.mapper.fromList(map?['moves']),
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveDamageClassApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'descriptions': DescriptionApiModel.mapper.toList(value.descriptions),
      'moves': MoveApiResource.mapper.toList(value.moves),
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

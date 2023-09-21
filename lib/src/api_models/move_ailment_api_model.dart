import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class MoveAilmentApiModel extends ApiModel {
  static var mapper = MoveAilmentApiModelMapper();

  final int id;

  final String name;

  final List<MoveApiResource> moves;

  final List<NameApiModel> names;

  const MoveAilmentApiModel({
    required this.id,
    required this.name,
    required this.moves,
    required this.names,
  });
}

class MoveAilmentApiModelMapper extends Mapper<MoveAilmentApiModel> {
  @override
  MoveAilmentApiModel fromMap(Map<String, dynamic>? map) {
    return MoveAilmentApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      moves: MoveApiResource.mapper.fromList(map?['moves']),
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveAilmentApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'moves': MoveApiResource.mapper.toList(value.moves),
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

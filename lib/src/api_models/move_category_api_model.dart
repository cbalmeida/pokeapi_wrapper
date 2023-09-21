import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class MoveCategoryApiModel extends ApiModel {
  static var mapper = MoveCategoryApiModelMapper();

  final int id;

  final String name;

  final List<MoveApiResource> moves;

  final List<DescriptionApiModel> descriptions;

  const MoveCategoryApiModel({
    required this.id,
    required this.name,
    required this.moves,
    required this.descriptions,
  });
}

class MoveCategoryApiModelMapper extends Mapper<MoveCategoryApiModel> {
  @override
  MoveCategoryApiModel fromMap(Map<String, dynamic>? map) {
    return MoveCategoryApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      moves: MoveApiResource.mapper.fromList(map?['moves']),
      descriptions: DescriptionApiModel.mapper.fromList(map?['descriptions']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveCategoryApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'moves': MoveApiResource.mapper.toList(value.moves),
      'descriptions': DescriptionApiModel.mapper.toList(value.descriptions),
    };
  }
}

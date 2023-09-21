import '../api_models.dart';
import '../core.dart';

class MoveBattleStyleApiModel extends ApiModel {
  static var mapper = MoveBattleStyleApiModelMapper();

  final int id;

  final String name;

  final List<NameApiModel> names;

  const MoveBattleStyleApiModel({
    required this.id,
    required this.name,
    required this.names,
  });
}

class MoveBattleStyleApiModelMapper extends Mapper<MoveBattleStyleApiModel> {
  @override
  MoveBattleStyleApiModel fromMap(Map<String, dynamic>? map) {
    return MoveBattleStyleApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveBattleStyleApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

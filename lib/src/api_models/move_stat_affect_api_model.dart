import '../../pokeapi_wrapper.dart';

class MoveStatAffectApiModel extends ApiModel {
  static var mapper = MoveStatAffectApiModelMapper();

  final int change;

  final MoveApiResource move;

  const MoveStatAffectApiModel({
    required this.change,
    required this.move,
  });
}

class MoveStatAffectApiModelMapper extends Mapper<MoveStatAffectApiModel> {
  @override
  MoveStatAffectApiModel fromMap(Map<String, dynamic>? map) {
    return MoveStatAffectApiModel(
      change: map?['change'] ?? 0,
      move: MoveApiResource.mapper.fromMap(map?['move']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveStatAffectApiModel value) {
    return {
      'change': value.change,
      'move': MoveApiResource.mapper.toMap(value.move),
    };
  }
}

import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class StatApiModel extends ApiModel {
  static var mapper = StatApiModelMapper();

  final int id;

  final String name;

  final int gameIndex;

  final bool isBattleOnly;

  final MoveStatAffectSetsApiModel affectingMoves;

  final NatureStatAffectSetsApiModel affectingNatures;

  final List<CharacteristicApiResource> characteristics;

  final MoveDamageClassApiResource moveDamageClass;

  final List<NameApiModel> names;

  const StatApiModel({
    required this.id,
    required this.name,
    required this.gameIndex,
    required this.isBattleOnly,
    required this.affectingMoves,
    required this.affectingNatures,
    required this.characteristics,
    required this.moveDamageClass,
    required this.names,
  });
}

class StatApiModelMapper extends Mapper<StatApiModel> {
  @override
  StatApiModel fromMap(Map<String, dynamic>? map) {
    return StatApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      gameIndex: map?['game_index'] ?? 0,
      isBattleOnly: map?['is_battle_only'] ?? false,
      affectingMoves: MoveStatAffectSetsApiModel.mapper.fromMap(map?['affecting_moves']),
      affectingNatures: NatureStatAffectSetsApiModel.mapper.fromMap(map?['affecting_natures']),
      characteristics: CharacteristicApiResource.mapper.fromList(map?['characteristics']),
      moveDamageClass: MoveDamageClassApiResource.mapper.fromMap(map?['move_damage_class']),
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(StatApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'game_index': value.gameIndex,
      'is_battle_only': value.isBattleOnly,
      'affecting_moves': MoveStatAffectSetsApiModel.mapper.toMap(value.affectingMoves),
      'affecting_natures': NatureStatAffectSetsApiModel.mapper.toMap(value.affectingNatures),
      'characteristics': CharacteristicApiResource.mapper.toList(value.characteristics),
      'move_damage_class': MoveDamageClassApiResource.mapper.toMap(value.moveDamageClass),
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

import '../../pokeapi_wrapper.dart';

class MoveBattleStylePreferenceApiModel {
  static var mapper = MoveBattleStylePreferenceApiModelMapper();

  final int lowHpPreference;

  final int highHpPreference;

  final MoveBattleStyleApiResource moveBattleStyle;

  const MoveBattleStylePreferenceApiModel({
    required this.lowHpPreference,
    required this.highHpPreference,
    required this.moveBattleStyle,
  });
}

class MoveBattleStylePreferenceApiModelMapper extends Mapper<MoveBattleStylePreferenceApiModel> {
  @override
  MoveBattleStylePreferenceApiModel fromMap(Map<String, dynamic>? map) {
    return MoveBattleStylePreferenceApiModel(
      lowHpPreference: map?['low_hp_preference'] ?? 0,
      highHpPreference: map?['high_hp_preference'] ?? 0,
      moveBattleStyle: MoveBattleStyleApiResource.mapper.fromMap(map?['move_battle_style']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveBattleStylePreferenceApiModel value) {
    return {
      'low_hp_preference': value.lowHpPreference,
      'high_hp_preference': value.highHpPreference,
      'move_battle_style': MoveBattleStyleApiResource.mapper.toMap(value.moveBattleStyle),
    };
  }
}

import '../../pokeapi_wrapper.dart';

class PokemonMoveVersionApiModel extends ApiModel {
  static var mapper = PokemonMoveVersionApiModelMapper();

  final MoveLearnMethodApiResource moveLearnMethod;

  final VersionGroupApiResource versionGroup;

  final int levelLearnedAt;

  const PokemonMoveVersionApiModel({
    required this.moveLearnMethod,
    required this.versionGroup,
    required this.levelLearnedAt,
  });
}

class PokemonMoveVersionApiModelMapper extends Mapper<PokemonMoveVersionApiModel> {
  @override
  PokemonMoveVersionApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonMoveVersionApiModel(
      moveLearnMethod: MoveLearnMethodApiResource.mapper.fromMap(map?['move_learn_method']),
      versionGroup: VersionGroupApiResource.mapper.fromMap(map?['version_group']),
      levelLearnedAt: map?['level_learned_at'] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonMoveVersionApiModel value) {
    return {
      'move_learn_method': MoveLearnMethodApiResource.mapper.toMap(value.moveLearnMethod),
      'version_group': VersionGroupApiResource.mapper.toMap(value.versionGroup),
      'level_learned_at': value.levelLearnedAt,
    };
  }
}

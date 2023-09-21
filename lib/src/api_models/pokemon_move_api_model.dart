import '../../pokeapi_wrapper.dart';
import 'pokemon_move_version_api_model.dart';

class PokemonMoveApiModel extends ApiModel {
  static var mapper = PokemonMoveApiModelMapper();

  final MoveApiResource move;

  final List<PokemonMoveVersionApiModel> versionGroupDetails;

  const PokemonMoveApiModel({
    required this.move,
    required this.versionGroupDetails,
  });
}

class PokemonMoveApiModelMapper extends Mapper<PokemonMoveApiModel> {
  @override
  PokemonMoveApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonMoveApiModel(
      move: MoveApiResource.mapper.fromMap(map?['move']),
      versionGroupDetails: PokemonMoveVersionApiModel.mapper.fromList(map?['version_group_details']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonMoveApiModel value) {
    return {
      'move': MoveApiResource.mapper.toMap(value.move),
      'version_group_details': PokemonMoveVersionApiModel.mapper.toList(value.versionGroupDetails),
    };
  }
}

import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class SuperContestEffectApiModel extends ApiModel {
  static var mapper = SuperContestEffectApiModelMapper();

  final int id;

  final int appeal;

  final List<FlavorTextApiModel> flavorTextEntries;

  final List<MoveApiResource> moves;

  const SuperContestEffectApiModel({
    required this.id,
    required this.appeal,
    required this.flavorTextEntries,
    required this.moves,
  });
}

class SuperContestEffectApiModelMapper extends Mapper<SuperContestEffectApiModel> {
  @override
  SuperContestEffectApiModel fromMap(Map<String, dynamic>? map) {
    return SuperContestEffectApiModel(
      id: map?['id'] ?? 0,
      appeal: map?['appeal'] ?? 0,
      flavorTextEntries: FlavorTextApiModel.mapper.fromList(map?['flavor_text_entries']),
      moves: MoveApiResource.mapper.fromList(map?['moves']),
    );
  }

  @override
  Map<String, dynamic> toMap(SuperContestEffectApiModel value) {
    return {
      'id': value.id,
      'appeal': value.appeal,
      'flavor_text_entries': FlavorTextApiModel.mapper.toList(value.flavorTextEntries),
      'moves': MoveApiResource.mapper.toList(value.moves),
    };
  }
}

import '../../pokeapi_wrapper.dart';

class GenerationGameIndexApiModel extends ApiModel {
  static var mapper = GenerationGameIndexApiModelMapper();

  final int gameIndex;

  final GenerationApiResource generation;

  const GenerationGameIndexApiModel({
    required this.gameIndex,
    required this.generation,
  });
}

class GenerationGameIndexApiModelMapper extends Mapper<GenerationGameIndexApiModel> {
  @override
  GenerationGameIndexApiModel fromMap(Map<String, dynamic>? map) {
    return GenerationGameIndexApiModel(
      gameIndex: map?['game_index'] ?? 0,
      generation: GenerationApiResource.mapper.fromMap(map?['generation']),
    );
  }

  @override
  Map<String, dynamic> toMap(GenerationGameIndexApiModel value) {
    return {
      'game_index': value.gameIndex,
      'generation': GenerationApiResource.mapper.toMap(value.generation),
    };
  }
}

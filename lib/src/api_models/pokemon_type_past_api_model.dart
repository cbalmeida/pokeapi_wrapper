import '../../pokeapi_wrapper.dart';
import 'pokemon_type_api_model.dart';

class PokemonTypePastApiModel extends ApiModel {
  static var mapper = PokemonTypePastApiModelMapper();

  final GenerationApiResource generation;

  final List<PokemonTypeApiModel> types;

  const PokemonTypePastApiModel({
    required this.generation,
    required this.types,
  });
}

class PokemonTypePastApiModelMapper extends Mapper<PokemonTypePastApiModel> {
  @override
  PokemonTypePastApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonTypePastApiModel(
      generation: GenerationApiResource.mapper.fromMap(map?['generation']),
      types: PokemonTypeApiModel.mapper.fromList(map?['types']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonTypePastApiModel value) {
    return {
      'generation': GenerationApiResource.mapper.toMap(value.generation),
      'types': PokemonTypeApiModel.mapper.toList(value.types),
    };
  }
}

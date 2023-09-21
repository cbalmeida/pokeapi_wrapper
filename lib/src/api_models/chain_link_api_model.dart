import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class ChainLinkApiModel extends ApiModel {
  static var mapper = ChainLinkApiModelMapper();

  final bool isBaby;

  final PokemonSpeciesApiResource species;

  final List<EvolutionDetailApiModel> evolutionDetails;

  final List<ChainLinkApiModel> evolvesTo;

  const ChainLinkApiModel({
    required this.isBaby,
    required this.species,
    required this.evolutionDetails,
    required this.evolvesTo,
  });
}

class ChainLinkApiModelMapper extends Mapper<ChainLinkApiModel> {
  @override
  ChainLinkApiModel fromMap(Map<String, dynamic>? map) {
    return ChainLinkApiModel(
      isBaby: map?['is_baby'] ?? false,
      species: PokemonSpeciesApiResource.mapper.fromMap(map?['species']),
      evolutionDetails: EvolutionDetailApiModel.mapper.fromList(map?['evolution_details']),
      evolvesTo: ChainLinkApiModel.mapper.fromList(map?['evolves_to']),
    );
  }

  @override
  Map<String, dynamic> toMap(ChainLinkApiModel value) {
    return {
      'is_baby': value.isBaby,
      'species': PokemonSpeciesApiResource.mapper.toMap(value.species),
      'evolution_details': EvolutionDetailApiModel.mapper.toList(value.evolutionDetails),
      'evolves_to': ChainLinkApiModel.mapper.toList(value.evolvesTo),
    };
  }
}

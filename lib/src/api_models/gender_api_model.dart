import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class GenderApiModel extends ApiModel {
  static var mapper = GenderApiModelMapper();

  final int id;

  final String name;

  final List<PokemonSpeciesGenderApiModel> pokemonSpeciesDetails;

  final List<PokemonSpeciesApiResource> requiredForEvolution;

  const GenderApiModel({
    required this.id,
    required this.name,
    required this.pokemonSpeciesDetails,
    required this.requiredForEvolution,
  });
}

class GenderApiModelMapper extends Mapper<GenderApiModel> {
  @override
  GenderApiModel fromMap(Map<String, dynamic>? map) {
    return GenderApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      pokemonSpeciesDetails: PokemonSpeciesGenderApiModel.mapper.fromList(map?['pokemon_species_details']),
      requiredForEvolution: PokemonSpeciesApiResource.mapper.fromList(map?['required_for_evolution']),
    );
  }

  @override
  Map<String, dynamic> toMap(GenderApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'pokemon_species_details': PokemonSpeciesGenderApiModel.mapper.toList(value.pokemonSpeciesDetails),
      'required_for_evolution': PokemonSpeciesApiResource.mapper.toList(value.requiredForEvolution),
    };
  }
}

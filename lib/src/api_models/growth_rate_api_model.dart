import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class GrowthRateApiModel extends ApiModel {
  static var mapper = GrowthRateApiModelMapper();

  final int id;

  final String name;

  final String formula;

  final List<DescriptionApiModel> descriptions;

  final List<GrowthRateExperienceLevelApiModel> levels;

  final List<PokemonSpeciesApiResource> pokemonSpecies;

  const GrowthRateApiModel({
    required this.id,
    required this.name,
    required this.formula,
    required this.descriptions,
    required this.levels,
    required this.pokemonSpecies,
  });
}

class GrowthRateApiModelMapper extends Mapper<GrowthRateApiModel> {
  @override
  GrowthRateApiModel fromMap(Map<String, dynamic>? map) {
    return GrowthRateApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      formula: map?['formula'] ?? '',
      descriptions: DescriptionApiModel.mapper.fromList(map?['descriptions']),
      levels: GrowthRateExperienceLevelApiModel.mapper.fromList(map?['levels']),
      pokemonSpecies: PokemonSpeciesApiResource.mapper.fromList(map?['pokemon_species']),
    );
  }

  @override
  Map<String, dynamic> toMap(GrowthRateApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'formula': value.formula,
      'descriptions': DescriptionApiModel.mapper.toList(value.descriptions),
      'levels': GrowthRateExperienceLevelApiModel.mapper.toList(value.levels),
      'pokemon_species': PokemonSpeciesApiResource.mapper.toList(value.pokemonSpecies),
    };
  }
}

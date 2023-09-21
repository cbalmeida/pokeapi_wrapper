import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class PokemonSpeciesApiModel extends ApiModel {
  static var mapper = PokemonSpeciesApiModelMapper();

  final int id;

  final String name;

  final int order;

  final int genderRate;

  final int captureRate;

  final int baseHappiness;

  final bool isBaby;

  final bool isLegendary;

  final bool isMythical;

  final int hatchCounter;

  final bool hasGenderDifferences;

  final bool formsSwitchable;

  final GrowthRateApiResource growthRate;

  final List<PokemonSpeciesDexEntryApiModel> pokedexNumbers;

  final List<EggGroupApiResource> eggGroups;

  final PokemonColorApiResource color;

  final PokemonShapeApiResource shape;

  final PokemonSpeciesApiResource evolvesFromSpecies;

  final EvolutionChainApiResource evolutionChain;

  final PokemonHabitatApiResource habitat;

  final GenerationApiResource generation;

  final List<NameApiModel> names;

  final List<PalParkEncounterAreaApiModel> palParkEncounters;

  final List<FlavorTextApiModel> flavorTextEntries;

  final List<DescriptionApiModel> formDescriptions;

  final List<GenusApiModel> genera;

  final List<PokemonSpeciesVarietyApiModel> varieties;

  const PokemonSpeciesApiModel({
    required this.id,
    required this.name,
    required this.order,
    required this.genderRate,
    required this.captureRate,
    required this.baseHappiness,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.hatchCounter,
    required this.hasGenderDifferences,
    required this.formsSwitchable,
    required this.growthRate,
    required this.pokedexNumbers,
    required this.eggGroups,
    required this.color,
    required this.shape,
    required this.evolvesFromSpecies,
    required this.evolutionChain,
    required this.habitat,
    required this.generation,
    required this.names,
    required this.palParkEncounters,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.genera,
    required this.varieties,
  });
}

class PokemonSpeciesApiModelMapper extends Mapper<PokemonSpeciesApiModel> {
  @override
  PokemonSpeciesApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonSpeciesApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      order: map?['order'] ?? 0,
      genderRate: map?['gender_rate'] ?? 0,
      captureRate: map?['capture_rate'] ?? 0,
      baseHappiness: map?['base_happiness'] ?? 0,
      isBaby: map?['is_baby'] ?? false,
      isLegendary: map?['is_legendary'] ?? false,
      isMythical: map?['is_mythical'] ?? false,
      hatchCounter: map?['hatch_counter'] ?? 0,
      hasGenderDifferences: map?['has_gender_differences'] ?? false,
      formsSwitchable: map?['forms_switchable'] ?? false,
      growthRate: GrowthRateApiResource.mapper.fromMap(map?['growth_rate']),
      pokedexNumbers: PokemonSpeciesDexEntryApiModel.mapper.fromList(map?['pokedex_numbers']),
      eggGroups: EggGroupApiResource.mapper.fromList(map?['egg_groups']),
      color: PokemonColorApiResource.mapper.fromMap(map?['color']),
      shape: PokemonShapeApiResource.mapper.fromMap(map?['shape']),
      evolvesFromSpecies: PokemonSpeciesApiResource.mapper.fromMap(map?['evolves_from_species']),
      evolutionChain: EvolutionChainApiResource.mapper.fromMap(map?['evolution_chain']),
      habitat: PokemonHabitatApiResource.mapper.fromMap(map?['habitat']),
      generation: GenerationApiResource.mapper.fromMap(map?['generation']),
      names: NameApiModel.mapper.fromList(map?['names']),
      palParkEncounters: PalParkEncounterAreaApiModel.mapper.fromList(map?['pal_park_encounters']),
      flavorTextEntries: FlavorTextApiModel.mapper.fromList(map?['flavor_text_entries']),
      formDescriptions: DescriptionApiModel.mapper.fromList(map?['form_descriptions']),
      genera: GenusApiModel.mapper.fromList(map?['genera']),
      varieties: PokemonSpeciesVarietyApiModel.mapper.fromList(map?['varieties']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonSpeciesApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'order': value.order,
      'gender_rate': value.genderRate,
      'capture_rate': value.captureRate,
      'base_happiness': value.baseHappiness,
      'is_baby': value.isBaby,
      'is_legendary': value.isLegendary,
      'is_mythical': value.isMythical,
      'hatch_counter': value.hatchCounter,
      'has_gender_differences': value.hasGenderDifferences,
      'forms_switchable': value.formsSwitchable,
      'growth_rate': GrowthRateApiResource.mapper.toMap(value.growthRate),
      'pokedex_numbers': PokemonSpeciesDexEntryApiModel.mapper.toList(value.pokedexNumbers),
      'egg_groups': EggGroupApiResource.mapper.toList(value.eggGroups),
      'color': PokemonColorApiResource.mapper.toMap(value.color),
      'shape': PokemonShapeApiResource.mapper.toMap(value.shape),
      'evolves_from_species': PokemonSpeciesApiResource.mapper.toMap(value.evolvesFromSpecies),
      'evolution_chain': EvolutionChainApiResource.mapper.toMap(value.evolutionChain),
      'habitat': PokemonHabitatApiResource.mapper.toMap(value.habitat),
      'generation': GenerationApiResource.mapper.toMap(value.generation),
      'names': NameApiModel.mapper.toList(value.names),
      'pal_park_encounters': PalParkEncounterAreaApiModel.mapper.toList(value.palParkEncounters),
      'flavor_text_entries': FlavorTextApiModel.mapper.toList(value.flavorTextEntries),
      'form_descriptions': DescriptionApiModel.mapper.toList(value.formDescriptions),
      'genera': GenusApiModel.mapper.toList(value.genera),
      'varieties': PokemonSpeciesVarietyApiModel.mapper.toList(value.varieties),
    };
  }
}

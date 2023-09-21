import '../../pokeapi_wrapper.dart';
import 'pokemon_ability_api_model.dart';
import 'pokemon_held_item_api_model.dart';
import 'pokemon_move_api_model.dart';
import 'pokemon_sprites_api_model.dart';
import 'pokemon_stat_api_model.dart';
import 'pokemon_type_api_model.dart';
import 'pokemon_type_past_api_model.dart';
import 'version_game_index_api_model.dart';

class PokemonApiModel extends ApiModel {
  static var mapper = PokemonApiModelMapper();

  final int id;

  final String name;

  final int baseExperience;

  final int height;

  final bool isDefault;

  final int order;

  final int weight;

  final List<PokemonAbilityApiModel> abilities;

  final List<PokemonFormApiResource> forms;

  final List<VersionGameIndexApiModel> gameIndices;

  final List<PokemonHeldItemApiModel> heldItems;

  final String locationAreaEncounters;

  final List<PokemonMoveApiModel> moves;

  final List<PokemonTypePastApiModel> pastTypes;

  final PokemonSpritesApiModel sprites;

  final PokemonSpeciesApiResource species;

  final List<PokemonStatApiModel> stats;

  final List<PokemonTypeApiModel> types;

  const PokemonApiModel({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    required this.forms,
    required this.gameIndices,
    required this.heldItems,
    required this.locationAreaEncounters,
    required this.moves,
    required this.pastTypes,
    required this.sprites,
    required this.species,
    required this.stats,
    required this.types,
  });
}

class PokemonApiModelMapper extends Mapper<PokemonApiModel> {
  @override
  PokemonApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      baseExperience: map?['base_experience'] ?? 0,
      height: map?['height'] ?? 0,
      isDefault: map?['is_default'] ?? false,
      order: map?['order'] ?? 0,
      weight: map?['weight'] ?? 0,
      abilities: PokemonAbilityApiModel.mapper.fromList(map?['abilities']),
      forms: PokemonFormApiResource.mapper.fromList(map?['forms']),
      gameIndices: VersionGameIndexApiModel.mapper.fromList(map?['game_indices']),
      heldItems: PokemonHeldItemApiModel.mapper.fromList(map?['held_items']),
      locationAreaEncounters: map?['location_area_encounters'] ?? '',
      moves: PokemonMoveApiModel.mapper.fromList(map?['moves']),
      pastTypes: PokemonTypePastApiModel.mapper.fromList(map?['past_types']),
      sprites: PokemonSpritesApiModel.mapper.fromMap(map?['sprites']),
      species: PokemonSpeciesApiResource.mapper.fromMap(map?['species']),
      stats: PokemonStatApiModel.mapper.fromList(map?['stats']),
      types: PokemonTypeApiModel.mapper.fromList(map?['types']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'base_experience': value.baseExperience,
      'height': value.height,
      'is_default': value.isDefault,
      'order': value.order,
      'weight': value.weight,
      'abilities': PokemonAbilityApiModel.mapper.toList(value.abilities),
      'forms': PokemonFormApiResource.mapper.toList(value.forms),
      'game_indices': VersionGameIndexApiModel.mapper.toList(value.gameIndices),
      'held_items': PokemonHeldItemApiModel.mapper.toList(value.heldItems),
      'location_area_encounters': value.locationAreaEncounters,
      'moves': PokemonMoveApiModel.mapper.toList(value.moves),
      'past_types': PokemonTypePastApiModel.mapper.toList(value.pastTypes),
      'sprites': PokemonSpritesApiModel.mapper.toMap(value.sprites),
      'species': PokemonSpeciesApiResource.mapper.toMap(value.species),
      'stats': PokemonStatApiModel.mapper.toList(value.stats),
      'types': PokemonTypeApiModel.mapper.toList(value.types),
    };
  }
}

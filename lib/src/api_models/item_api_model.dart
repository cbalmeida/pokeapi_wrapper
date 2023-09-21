import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class ItemApiModel extends ApiModel {
  static var mapper = ItemApiModelMapper();

  final int id;

  final String name;

  final int cost;

  final int flingPower;

  final ItemFlingEffectApiResource flingEffect;

  final List<ItemAttributeApiResource> attributes;

  final ItemCategoryApiResource category;

  final List<VerboseEffectApiModel> effectEntries;

  final List<VersionGroupFlavorTextApiModel> flavorTextEntries;

  final List<GenerationGameIndexApiModel> gameIndices;

  final List<NameApiModel> names;

  final ItemSpritesApiModel sprites;

  final List<ItemHolderPokemonApiModel> heldByPokemon;

  final EvolutionChainApiResource babyTriggerFor;

  final List<MachineVersionDetailApiModel> machines;

  const ItemApiModel({
    required this.id,
    required this.name,
    required this.cost,
    required this.flingPower,
    required this.flingEffect,
    required this.attributes,
    required this.category,
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.gameIndices,
    required this.names,
    required this.sprites,
    required this.heldByPokemon,
    required this.babyTriggerFor,
    required this.machines,
  });
}

class ItemApiModelMapper extends Mapper<ItemApiModel> {
  @override
  ItemApiModel fromMap(Map<String, dynamic>? map) {
    return ItemApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      cost: map?['cost'] ?? 0,
      flingPower: map?['fling_power'] ?? 0,
      flingEffect: ItemFlingEffectApiResource.mapper.fromMap(map?['fling_effect']),
      attributes: ItemAttributeApiResource.mapper.fromList(map?['attributes']),
      category: ItemCategoryApiResource.mapper.fromMap(map?['category']),
      effectEntries: VerboseEffectApiModel.mapper.fromList(map?['effect_entries']),
      flavorTextEntries: VersionGroupFlavorTextApiModel.mapper.fromList(map?['flavor_text_entries']),
      gameIndices: GenerationGameIndexApiModel.mapper.fromList(map?['game_indices']),
      names: NameApiModel.mapper.fromList(map?['names']),
      sprites: ItemSpritesApiModel.mapper.fromMap(map?['sprites']),
      heldByPokemon: ItemHolderPokemonApiModel.mapper.fromList(map?['held_by_pokemon']),
      babyTriggerFor: EvolutionChainApiResource.mapper.fromMap(map?['baby_trigger_for']),
      machines: MachineVersionDetailApiModel.mapper.fromList(map?['machines']),
    );
  }

  @override
  Map<String, dynamic> toMap(ItemApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'cost': value.cost,
      'fling_power': value.flingPower,
      'fling_effect': ItemFlingEffectApiResource.mapper.toMap(value.flingEffect),
      'attributes': ItemAttributeApiResource.mapper.toList(value.attributes),
      'category': ItemCategoryApiResource.mapper.toMap(value.category),
      'effect_entries': VerboseEffectApiModel.mapper.toList(value.effectEntries),
      'flavor_text_entries': VersionGroupFlavorTextApiModel.mapper.toList(value.flavorTextEntries),
      'game_indices': GenerationGameIndexApiModel.mapper.toList(value.gameIndices),
      'names': NameApiModel.mapper.toList(value.names),
      'sprites': ItemSpritesApiModel.mapper.toMap(value.sprites),
      'held_by_pokemon': ItemHolderPokemonApiModel.mapper.toList(value.heldByPokemon),
      'baby_trigger_for': EvolutionChainApiResource.mapper.toMap(value.babyTriggerFor),
      'machines': MachineVersionDetailApiModel.mapper.toList(value.machines),
    };
  }
}

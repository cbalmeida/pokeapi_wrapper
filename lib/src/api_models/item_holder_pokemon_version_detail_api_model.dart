import '../../pokeapi_wrapper.dart';

class ItemHolderPokemonVersionDetailApiModel {
  static var mapper = ItemHolderPokemonVersionDetailApiModelMapper();

  final int rarity;

  final VersionApiResource version;

  const ItemHolderPokemonVersionDetailApiModel({
    required this.rarity,
    required this.version,
  });
}

class ItemHolderPokemonVersionDetailApiModelMapper extends Mapper<ItemHolderPokemonVersionDetailApiModel> {
  @override
  ItemHolderPokemonVersionDetailApiModel fromMap(Map<String, dynamic>? map) {
    return ItemHolderPokemonVersionDetailApiModel(
      rarity: map?['rarity'] ?? 0,
      version: VersionApiResource.mapper.fromMap(map?['version']),
    );
  }

  @override
  Map<String, dynamic> toMap(ItemHolderPokemonVersionDetailApiModel value) {
    return {
      'rarity': value.rarity,
      'version': VersionApiResource.mapper.toMap(value.version),
    };
  }
}

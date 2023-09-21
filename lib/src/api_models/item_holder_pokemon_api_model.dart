import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class ItemHolderPokemonApiModel extends ApiModel {
  static var mapper = ItemHolderPokemonApiModelMapper();

  final PokemonApiResource pokemon;

  final List<ItemHolderPokemonVersionDetailApiModel> versionDetails;

  const ItemHolderPokemonApiModel({
    required this.pokemon,
    required this.versionDetails,
  });
}

class ItemHolderPokemonApiModelMapper extends Mapper<ItemHolderPokemonApiModel> {
  @override
  ItemHolderPokemonApiModel fromMap(Map<String, dynamic>? map) {
    return ItemHolderPokemonApiModel(
      pokemon: PokemonApiResource.mapper.fromMap(map?['pokemon']),
      versionDetails: ItemHolderPokemonVersionDetailApiModel.mapper.fromList(map?['version_details']),
    );
  }

  @override
  Map<String, dynamic> toMap(ItemHolderPokemonApiModel value) {
    return {
      'pokemon': PokemonApiResource.mapper.toMap(value.pokemon),
      'version_details': ItemHolderPokemonVersionDetailApiModel.mapper.toList(value.versionDetails),
    };
  }
}

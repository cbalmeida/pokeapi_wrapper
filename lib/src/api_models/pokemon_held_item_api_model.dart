import '../../pokeapi_wrapper.dart';
import 'pokemon_held_item_version_api_model.dart';

class PokemonHeldItemApiModel extends ApiModel {
  static var mapper = PokemonHeldItemApiModelMapper();

  final ItemApiResource item;

  final List<PokemonHeldItemVersionApiModel> versionDetails;

  const PokemonHeldItemApiModel({
    required this.item,
    required this.versionDetails,
  });
}

class PokemonHeldItemApiModelMapper extends Mapper<PokemonHeldItemApiModel> {
  @override
  PokemonHeldItemApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonHeldItemApiModel(
      item: ItemApiResource.mapper.fromMap(map?['item']),
      versionDetails: PokemonHeldItemVersionApiModel.mapper.fromList(map?['version_details']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonHeldItemApiModel value) {
    return {
      'item': ItemApiResource.mapper.toMap(value.item),
      'version_details': PokemonHeldItemVersionApiModel.mapper.toList(value.versionDetails),
    };
  }
}

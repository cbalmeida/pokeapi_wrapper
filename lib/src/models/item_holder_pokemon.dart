import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ItemHolderPokemon extends Model<ItemHolderPokemonApiModel> {
  static var adapter = ItemHolderPokemonAdapter();

  const ItemHolderPokemon({required super.service, required super.apiModel});

  /// The Pokémon that holds this item.
  Future<Either<Error, Pokemon>> get pokemon => Pokemon.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokemon);

  /// The details for the version that this item is held in by the Pokémon.
  List<ItemHolderPokemonVersionDetail> get versionDetails => ItemHolderPokemonVersionDetail.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.versionDetails);
}

class ItemHolderPokemonAdapter extends ApiModelAdapter<ItemHolderPokemonApiModel, ItemHolderPokemon> {
  @override
  ItemHolderPokemon createModelFromApiModel({required IService service, required ItemHolderPokemonApiModel apiModel}) {
    return ItemHolderPokemon(service: service, apiModel: apiModel);
  }
}

class ItemHolderPokemonApiResource extends ApiResource {
  const ItemHolderPokemonApiResource({required super.url});

  static get mapper => ItemHolderPokemonApiResourceMapper();
}

class ItemHolderPokemonApiResourceMapper extends ApiResourceMapper<ItemHolderPokemonApiResource> {
  @override
  ItemHolderPokemonApiResource fromUrl(String url) {
    return ItemHolderPokemonApiResource(url: url);
  }
}

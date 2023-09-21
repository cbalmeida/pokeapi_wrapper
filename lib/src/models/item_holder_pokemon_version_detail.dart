import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ItemHolderPokemonVersionDetail extends Model<ItemHolderPokemonVersionDetailApiModel> {
  static var adapter = ItemHolderPokemonVersionDetailAdapter();

  const ItemHolderPokemonVersionDetail({required super.service, required super.apiModel});

  /// How often this Pokémon holds this item in this version.
  int get rarity => apiModel.rarity;

  /// The version that this item is held in by the Pokémon.
  Future<Either<Error, Version>> get version => Version.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.version);
}

class ItemHolderPokemonVersionDetailAdapter extends ApiModelAdapter<ItemHolderPokemonVersionDetailApiModel, ItemHolderPokemonVersionDetail> {
  @override
  ItemHolderPokemonVersionDetail createModelFromApiModel({required IService service, required ItemHolderPokemonVersionDetailApiModel apiModel}) {
    return ItemHolderPokemonVersionDetail(service: service, apiModel: apiModel);
  }
}

class ItemHolderPokemonVersionDetailApiResource extends ApiResource {
  const ItemHolderPokemonVersionDetailApiResource({required super.url});

  static get mapper => ItemHolderPokemonVersionDetailApiResourceMapper();
}

class ItemHolderPokemonVersionDetailApiResourceMapper extends ApiResourceMapper<ItemHolderPokemonVersionDetailApiResource> {
  @override
  ItemHolderPokemonVersionDetailApiResource fromUrl(String url) {
    return ItemHolderPokemonVersionDetailApiResource(url: url);
  }
}

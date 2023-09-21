import '../api_models.dart';
import '../core.dart';
import '../services.dart';

class ItemSprites extends Model<ItemSpritesApiModel> {
  static var adapter = ItemSpritesAdapter();

  const ItemSprites({required super.service, required super.apiModel});

  /// The default depiction of this item.
  String get defaultValue => apiModel.defaultValue;
}

class ItemSpritesAdapter extends ApiModelAdapter<ItemSpritesApiModel, ItemSprites> {
  @override
  ItemSprites createModelFromApiModel({required IService service, required ItemSpritesApiModel apiModel}) {
    return ItemSprites(service: service, apiModel: apiModel);
  }
}

class ItemSpritesApiResource extends ApiResource {
  const ItemSpritesApiResource({required super.url});

  static get mapper => ItemSpritesApiResourceMapper();
}

class ItemSpritesApiResourceMapper extends ApiResourceMapper<ItemSpritesApiResource> {
  @override
  ItemSpritesApiResource fromUrl(String url) {
    return ItemSpritesApiResource(url: url);
  }
}

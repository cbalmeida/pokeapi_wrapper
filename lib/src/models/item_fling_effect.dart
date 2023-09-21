import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ItemFlingEffect extends Model<ItemFlingEffectApiModel> {
  static var adapter = ItemFlingEffectAdapter();

  const ItemFlingEffect({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The result of this fling effect listed in different languages.
  List<Effect> get effectEntries => Effect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.effectEntries);

  /// A list of items that have this fling effect.
  Future<Either<Error, List<Item>>> get items => Item.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.items);
}

class ItemFlingEffectAdapter extends ApiResourceAdapter<ItemFlingEffectApiModel, ItemFlingEffect, ItemFlingEffectApiResource> {
  @override
  Future<Either<Error, ItemFlingEffectApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getItemFlingEffect(apiResource.url);
  }

  @override
  ItemFlingEffect createModelFromApiModel({required IService service, required ItemFlingEffectApiModel apiModel}) {
    return ItemFlingEffect(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/item-fling-effect';

  @override
  Future<Either<Error, List<ItemFlingEffectApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getItemFlingEffectList(offSet: offSet, limit: limit);
  }
}

class ItemFlingEffectApiResource extends ApiResource {
  const ItemFlingEffectApiResource({required super.url});

  static get mapper => ItemFlingEffectApiResourceMapper();
}

class ItemFlingEffectApiResourceMapper extends ApiResourceMapper<ItemFlingEffectApiResource> {
  @override
  ItemFlingEffectApiResource fromUrl(String url) {
    return ItemFlingEffectApiResource(url: url);
  }
}

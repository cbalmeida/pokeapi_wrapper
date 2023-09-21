import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ItemPocket extends Model<ItemPocketApiModel> {
  static var adapter = ItemPocketAdapter();

  const ItemPocket({required super.service, required super.apiModel});

  /// The identifier for this item pocket resource
  int get id => apiModel.id;

  /// The name for this item pocket resource
  String get name => apiModel.name;

  /// A list of item categories that are relevant to this item pocket
  Future<Either<Error, List<ItemCategory>>> get categories => ItemCategory.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.categories);

  /// The name of this item pocket listed in different languages
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class ItemPocketAdapter extends ApiResourceAdapter<ItemPocketApiModel, ItemPocket, ItemPocketApiResource> {
  @override
  Future<Either<Error, ItemPocketApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getItemPocket(apiResource.url);
  }

  @override
  ItemPocket createModelFromApiModel({required IService service, required ItemPocketApiModel apiModel}) {
    return ItemPocket(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/item-pocket';

  @override
  Future<Either<Error, List<ItemPocketApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getItemPocketList(offSet: offSet, limit: limit);
  }
}

class ItemPocketApiResource extends ApiResource {
  const ItemPocketApiResource({required super.url});

  static get mapper => ItemPocketApiResourceMapper();
}

class ItemPocketApiResourceMapper extends ApiResourceMapper<ItemPocketApiResource> {
  @override
  ItemPocketApiResource fromUrl(String url) {
    return ItemPocketApiResource(url: url);
  }
}

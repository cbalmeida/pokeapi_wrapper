import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ItemCategory extends Model<ItemCategoryApiModel> {
  static var adapter = ItemCategoryAdapter();

  const ItemCategory({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// A list of items that are a part of this category.
  Future<Either<Error, List<Item>>> get items => Item.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.items);

  /// The name of this item category listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// The pocket items in this category would be put in.
  Future<Either<Error, ItemPocket>> get pocket => ItemPocket.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pocket);
}

class ItemCategoryAdapter extends ApiResourceAdapter<ItemCategoryApiModel, ItemCategory, ItemCategoryApiResource> {
  @override
  Future<Either<Error, ItemCategoryApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getItemCategory(apiResource.url);
  }

  @override
  ItemCategory createModelFromApiModel({required IService service, required ItemCategoryApiModel apiModel}) {
    return ItemCategory(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/item-category';

  @override
  Future<Either<Error, List<ItemCategoryApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getItemCategoryList(offSet: offSet, limit: limit);
  }
}

class ItemCategoryApiResource extends ApiResource {
  const ItemCategoryApiResource({required super.url});

  static get mapper => ItemCategoryApiResourceMapper();
}

class ItemCategoryApiResourceMapper extends ApiResourceMapper<ItemCategoryApiResource> {
  @override
  ItemCategoryApiResource fromUrl(String url) {
    return ItemCategoryApiResource(url: url);
  }
}

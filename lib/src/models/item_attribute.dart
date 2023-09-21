import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ItemAttribute extends Model<ItemAttributeApiModel> {
  static var adapter = ItemAttributeAdapter();

  const ItemAttribute({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// A list of items that have this attribute.
  Future<Either<Error, List<Item>>> get items => Item.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.items);

  /// The name of this item attribute listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// The description of this item attribute listed in different languages.
  List<Description> get descriptions => Description.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.descriptions);
}

class ItemAttributeAdapter extends ApiResourceAdapter<ItemAttributeApiModel, ItemAttribute, ItemAttributeApiResource> {
  @override
  Future<Either<Error, ItemAttributeApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getItemAttribute(apiResource.url);
  }

  @override
  ItemAttribute createModelFromApiModel({required IService service, required ItemAttributeApiModel apiModel}) {
    return ItemAttribute(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/item-attribute';

  @override
  Future<Either<Error, List<ItemAttributeApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getItemAttributeList(offSet: offSet, limit: limit);
  }
}

class ItemAttributeApiResource extends ApiResource {
  const ItemAttributeApiResource({required super.url});

  static get mapper => ItemAttributeApiResourceMapper();
}

class ItemAttributeApiResourceMapper extends ApiResourceMapper<ItemAttributeApiResource> {
  @override
  ItemAttributeApiResource fromUrl(String url) {
    return ItemAttributeApiResource(url: url);
  }
}

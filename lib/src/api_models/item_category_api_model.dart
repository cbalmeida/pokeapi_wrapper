import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class ItemCategoryApiModel extends ApiModel {
  static var mapper = ItemCategoryApiModelMapper();

  final int id;

  final String name;

  final List<ItemApiResource> items;

  final List<NameApiModel> names;

  final ItemPocketApiResource pocket;

  const ItemCategoryApiModel({
    required this.id,
    required this.name,
    required this.items,
    required this.names,
    required this.pocket,
  });
}

class ItemCategoryApiModelMapper extends Mapper<ItemCategoryApiModel> {
  @override
  ItemCategoryApiModel fromMap(Map<String, dynamic>? map) {
    return ItemCategoryApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      items: ItemApiResource.mapper.fromList(map?['items']),
      names: NameApiModel.mapper.fromList(map?['names']),
      pocket: ItemPocketApiResource.mapper.fromMap(map?['pocket']),
    );
  }

  @override
  Map<String, dynamic> toMap(ItemCategoryApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'items': ItemApiResource.mapper.toList(value.items),
      'names': NameApiModel.mapper.toList(value.names),
      'pocket': ItemPocketApiResource.mapper.toMap(value.pocket),
    };
  }
}

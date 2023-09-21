import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class ItemPocketApiModel extends ApiModel {
  static var mapper = ItemPocketApiModelMapper();

  final int id;

  final String name;

  final List<ItemCategoryApiResource> categories;

  final List<NameApiModel> names;

  const ItemPocketApiModel({
    required this.id,
    required this.name,
    required this.categories,
    required this.names,
  });
}

class ItemPocketApiModelMapper extends Mapper<ItemPocketApiModel> {
  @override
  ItemPocketApiModel fromMap(Map<String, dynamic>? map) {
    return ItemPocketApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      categories: ItemCategoryApiResource.mapper.fromList(map?['categories']),
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(ItemPocketApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'categories': ItemCategoryApiResource.mapper.toList(value.categories),
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

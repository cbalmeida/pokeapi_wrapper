import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class ItemAttributeApiModel extends ApiModel {
  static var mapper = ItemAttributeApiModelMapper();

  final int id;

  final String name;

  final List<ItemApiResource> items;

  final List<NameApiModel> names;

  final List<DescriptionApiModel> descriptions;

  const ItemAttributeApiModel({
    required this.id,
    required this.name,
    required this.items,
    required this.names,
    required this.descriptions,
  });
}

class ItemAttributeApiModelMapper extends Mapper<ItemAttributeApiModel> {
  @override
  ItemAttributeApiModel fromMap(Map<String, dynamic>? map) {
    return ItemAttributeApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      items: ItemApiResource.mapper.fromList(map?['items']),
      names: NameApiModel.mapper.fromList(map?['names']),
      descriptions: DescriptionApiModel.mapper.fromList(map?['descriptions']),
    );
  }

  @override
  Map<String, dynamic> toMap(ItemAttributeApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'items': ItemApiResource.mapper.toList(value.items),
      'names': NameApiModel.mapper.toList(value.names),
      'descriptions': DescriptionApiModel.mapper.toList(value.descriptions),
    };
  }
}

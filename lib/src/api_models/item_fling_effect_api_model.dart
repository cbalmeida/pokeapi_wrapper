import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class ItemFlingEffectApiModel extends ApiModel {
  static var mapper = ItemFlingEffectApiModelMapper();

  final int id;

  final String name;

  final List<EffectApiModel> effectEntries;

  final List<ItemApiResource> items;

  const ItemFlingEffectApiModel({
    required this.id,
    required this.name,
    required this.effectEntries,
    required this.items,
  });
}

class ItemFlingEffectApiModelMapper extends Mapper<ItemFlingEffectApiModel> {
  @override
  ItemFlingEffectApiModel fromMap(Map<String, dynamic>? map) {
    return ItemFlingEffectApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      effectEntries: EffectApiModel.mapper.fromList(map?['effect_entries']),
      items: ItemApiResource.mapper.fromList(map?['items']),
    );
  }

  @override
  Map<String, dynamic> toMap(ItemFlingEffectApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'effect_entries': EffectApiModel.mapper.toList(value.effectEntries),
      'items': ItemApiResource.mapper.toList(value.items),
    };
  }
}

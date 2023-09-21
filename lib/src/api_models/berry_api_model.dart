import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class BerryApiModel extends ApiModel {
  static var mapper = BerryApiModelMapper();

  final int id;

  final String name;

  final int growthTime;

  final int maxHarvest;

  final int naturalGiftPower;

  final int size;

  final int smoothness;

  final int soilDryness;

  final BerryFirmnessApiResource firmness;

  final List<BerryFlavorMapApiModel> flavors;

  final ItemApiResource item;

  final TypeApiResource naturalGiftType;

  const BerryApiModel({
    required this.id,
    required this.name,
    required this.growthTime,
    required this.maxHarvest,
    required this.naturalGiftPower,
    required this.size,
    required this.smoothness,
    required this.soilDryness,
    required this.firmness,
    required this.flavors,
    required this.item,
    required this.naturalGiftType,
  });
}

class BerryApiModelMapper extends Mapper<BerryApiModel> {
  @override
  BerryApiModel fromMap(Map<String, dynamic>? map) {
    return BerryApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      growthTime: map?['growth_time'] ?? 0,
      maxHarvest: map?['max_harvest'] ?? 0,
      naturalGiftPower: map?['natural_gift_power'] ?? 0,
      size: map?['size'] ?? 0,
      smoothness: map?['smoothness'] ?? 0,
      soilDryness: map?['soil_dryness'] ?? 0,
      firmness: BerryFirmnessApiResource.mapper.fromMap(map?['firmness']),
      flavors: BerryFlavorMapApiModel.mapper.fromList(map?['flavors']),
      item: ItemApiResource.mapper.fromMap(map?['item']),
      naturalGiftType: TypeApiResource.mapper.fromMap(map?['natural_gift_type']),
    );
  }

  @override
  Map<String, dynamic> toMap(BerryApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'growth_time': value.growthTime,
      'max_harvest': value.maxHarvest,
      'natural_gift_power': value.naturalGiftPower,
      'size': value.size,
      'smoothness': value.smoothness,
      'soil_dryness': value.soilDryness,
      'firmness': BerryFirmnessApiResource.mapper.toMap(value.firmness),
      'flavors': BerryFlavorMapApiModel.mapper.toList(value.flavors),
      'item': ItemApiResource.mapper.toMap(value.item),
      'natural_gift_type': TypeApiResource.mapper.toMap(value.naturalGiftType),
    };
  }
}

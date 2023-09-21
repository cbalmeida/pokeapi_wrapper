import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class BerryFirmnessApiModel extends ApiModel {
  static var mapper = BerryFirmnessApiModelMapper();

  final int id;

  final String name;

  final List<BerryApiResource> berries;

  final List<NameApiModel> names;

  const BerryFirmnessApiModel({
    required this.id,
    required this.name,
    required this.berries,
    required this.names,
  });
}

class BerryFirmnessApiModelMapper extends Mapper<BerryFirmnessApiModel> {
  @override
  BerryFirmnessApiModel fromMap(Map<String, dynamic>? map) {
    return BerryFirmnessApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      berries: BerryApiResource.mapper.fromList(map?['berries']),
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(BerryFirmnessApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'berries': BerryApiResource.mapper.toList(value.berries),
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

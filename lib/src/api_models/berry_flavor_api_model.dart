import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class BerryFlavorApiModel extends ApiModel {
  static var mapper = BerryFlavorApiModelMapper();

  final int id;

  final String name;

  final List<FlavorBerryMapApiModel> berries;

  final ContestTypeApiResource contestType;

  final List<NameApiModel> names;

  const BerryFlavorApiModel({
    required this.id,
    required this.name,
    required this.berries,
    required this.contestType,
    required this.names,
  });
}

class BerryFlavorApiModelMapper extends Mapper<BerryFlavorApiModel> {
  @override
  BerryFlavorApiModel fromMap(Map<String, dynamic>? map) {
    return BerryFlavorApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      berries: FlavorBerryMapApiModel.mapper.fromList(map?['berries']),
      contestType: ContestTypeApiResource.mapper.fromMap(map?['contest_type']),
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(BerryFlavorApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'berries': FlavorBerryMapApiModel.mapper.toList(value.berries),
      'contest_type': ContestTypeApiResource.mapper.toMap(value.contestType),
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

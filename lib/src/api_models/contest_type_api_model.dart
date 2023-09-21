import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class ContestTypeApiModel extends ApiModel {
  static var mapper = ContestTypeApiModelMapper();

  final int id;

  final String name;

  final BerryFlavorApiResource berryFlavor;

  final List<ContestNameApiModel> names;

  const ContestTypeApiModel({
    required this.id,
    required this.name,
    required this.berryFlavor,
    required this.names,
  });
}

class ContestTypeApiModelMapper extends Mapper<ContestTypeApiModel> {
  @override
  ContestTypeApiModel fromMap(Map<String, dynamic>? map) {
    return ContestTypeApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      berryFlavor: BerryFlavorApiResource.mapper.fromMap(map?['berry_flavor']),
      names: ContestNameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(ContestTypeApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'berry_flavor': BerryFlavorApiResource.mapper.toMap(value.berryFlavor),
      'names': ContestNameApiModel.mapper.toList(value.names),
    };
  }
}

import '../../pokeapi_wrapper.dart';

class BerryFlavorMapApiModel extends ApiModel {
  static var mapper = BerryFlavorMapApiModelMapper();

  final int potency;

  final BerryFlavorApiResource flavor;

  const BerryFlavorMapApiModel({
    required this.potency,
    required this.flavor,
  });
}

class BerryFlavorMapApiModelMapper extends Mapper<BerryFlavorMapApiModel> {
  @override
  BerryFlavorMapApiModel fromMap(Map<String, dynamic>? map) {
    return BerryFlavorMapApiModel(
      potency: map?['potency'] ?? 0,
      flavor: BerryFlavorApiResource.mapper.fromMap(map?['flavor']),
    );
  }

  @override
  Map<String, dynamic> toMap(BerryFlavorMapApiModel value) {
    return {
      'potency': value.potency,
      'flavor': BerryFlavorApiResource.mapper.toMap(value.flavor),
    };
  }
}

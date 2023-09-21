import '../../pokeapi_wrapper.dart';

class FlavorBerryMapApiModel extends ApiModel {
  static var mapper = FlavorBerryMapApiModelMapper();

  final int potency;

  final BerryApiResource berry;

  const FlavorBerryMapApiModel({
    required this.potency,
    required this.berry,
  });
}

class FlavorBerryMapApiModelMapper extends Mapper<FlavorBerryMapApiModel> {
  @override
  FlavorBerryMapApiModel fromMap(Map<String, dynamic>? map) {
    return FlavorBerryMapApiModel(
      potency: map?['potency'] ?? 0,
      berry: BerryApiResource.mapper.fromMap(map?['berry']),
    );
  }

  @override
  Map<String, dynamic> toMap(FlavorBerryMapApiModel value) {
    return {
      'potency': value.potency,
      'berry': BerryApiResource.mapper.toMap(value.berry),
    };
  }
}

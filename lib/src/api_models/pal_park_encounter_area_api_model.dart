import '../../pokeapi_wrapper.dart';

class PalParkEncounterAreaApiModel extends ApiModel {
  static var mapper = PalParkEncounterAreaApiModelMapper();

  final int baseScore;

  final int rate;

  final PalParkAreaApiResource area;

  const PalParkEncounterAreaApiModel({
    required this.baseScore,
    required this.rate,
    required this.area,
  });
}

class PalParkEncounterAreaApiModelMapper extends Mapper<PalParkEncounterAreaApiModel> {
  @override
  PalParkEncounterAreaApiModel fromMap(Map<String, dynamic>? map) {
    return PalParkEncounterAreaApiModel(
      baseScore: map?['base_score'] ?? 0,
      rate: map?['rate'] ?? 0,
      area: PalParkAreaApiResource.mapper.fromMap(map?['area']),
    );
  }

  @override
  Map<String, dynamic> toMap(PalParkEncounterAreaApiModel value) {
    return {
      'base_score': value.baseScore,
      'rate': value.rate,
      'area': PalParkAreaApiResource.mapper.toMap(value.area),
    };
  }
}

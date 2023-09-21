import '../../pokeapi_wrapper.dart';

class NatureStatChangeApiModel extends ApiModel {
  static var mapper = NatureStatChangeApiModelMapper();

  final int maxChange;

  final PokeathlonStatApiResource pokeathlonStat;

  const NatureStatChangeApiModel({
    required this.maxChange,
    required this.pokeathlonStat,
  });
}

class NatureStatChangeApiModelMapper extends Mapper<NatureStatChangeApiModel> {
  @override
  NatureStatChangeApiModel fromMap(Map<String, dynamic>? map) {
    return NatureStatChangeApiModel(
      maxChange: map?['max_change'] ?? 0,
      pokeathlonStat: PokeathlonStatApiResource.mapper.fromMap(map?['pokeathlon_stat']),
    );
  }

  @override
  Map<String, dynamic> toMap(NatureStatChangeApiModel value) {
    return {
      'max_change': value.maxChange,
      'pokeathlon_stat': PokeathlonStatApiResource.mapper.toMap(value.pokeathlonStat),
    };
  }
}

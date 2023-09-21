import '../../pokeapi_wrapper.dart';

class EncounterVersionDetailsApiModel {
  static var mapper = EncounterVersionDetailsApiModelMapper();

  final int rate;

  final VersionApiResource version;

  const EncounterVersionDetailsApiModel({
    required this.rate,
    required this.version,
  });
}

class EncounterVersionDetailsApiModelMapper extends Mapper<EncounterVersionDetailsApiModel> {
  @override
  EncounterVersionDetailsApiModel fromMap(Map<String, dynamic>? map) {
    return EncounterVersionDetailsApiModel(
      rate: map?['rate'] ?? 0,
      version: VersionApiResource.mapper.fromMap(map?['version']),
    );
  }

  @override
  Map<String, dynamic> toMap(EncounterVersionDetailsApiModel value) {
    return {
      'rate': value.rate,
      'version': VersionApiResource.mapper.toMap(value.version),
    };
  }
}

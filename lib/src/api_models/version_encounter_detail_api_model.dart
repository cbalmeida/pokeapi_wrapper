import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class VersionEncounterDetailApiModel extends ApiModel {
  static var mapper = VersionEncounterDetailApiModelMapper();

  final VersionApiResource version;

  final int maxChance;

  final List<EncounterApiModel> encounterDetails;

  const VersionEncounterDetailApiModel({
    required this.version,
    required this.maxChance,
    required this.encounterDetails,
  });
}

class VersionEncounterDetailApiModelMapper extends Mapper<VersionEncounterDetailApiModel> {
  @override
  VersionEncounterDetailApiModel fromMap(Map<String, dynamic>? map) {
    return VersionEncounterDetailApiModel(
      version: VersionApiResource.mapper.fromMap(map?['version']),
      maxChance: map?['max_chance'] ?? 0,
      encounterDetails: EncounterApiModel.mapper.fromList(map?['encounter_details']),
    );
  }

  @override
  Map<String, dynamic> toMap(VersionEncounterDetailApiModel value) {
    return {
      'version': VersionApiResource.mapper.toMap(value.version),
      'max_chance': value.maxChance,
      'encounter_details': EncounterApiModel.mapper.toList(value.encounterDetails),
    };
  }
}

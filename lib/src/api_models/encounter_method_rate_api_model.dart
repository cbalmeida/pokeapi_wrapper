import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class EncounterMethodRateApiModel extends ApiModel {
  static var mapper = EncounterMethodRateApiModelMapper();

  final EncounterMethodApiResource encounterMethod;

  final List<EncounterVersionDetailsApiModel> versionDetails;

  const EncounterMethodRateApiModel({
    required this.encounterMethod,
    required this.versionDetails,
  });
}

class EncounterMethodRateApiModelMapper extends Mapper<EncounterMethodRateApiModel> {
  @override
  EncounterMethodRateApiModel fromMap(Map<String, dynamic>? map) {
    return EncounterMethodRateApiModel(
      encounterMethod: EncounterMethodApiResource.mapper.fromMap(map?['encounter_method']),
      versionDetails: EncounterVersionDetailsApiModel.mapper.fromList(map?['version_details']),
    );
  }

  @override
  Map<String, dynamic> toMap(EncounterMethodRateApiModel value) {
    return {
      'encounter_method': EncounterMethodApiResource.mapper.toMap(value.encounterMethod),
      'version_details': EncounterVersionDetailsApiModel.mapper.toList(value.versionDetails),
    };
  }
}

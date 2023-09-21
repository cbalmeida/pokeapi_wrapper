import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class LocationAreaEncounterApiModel extends ApiModel {
  static var mapper = LocationAreaEncounterApiModelMapper();

  final LocationAreaApiResource locationArea;

  final List<VersionEncounterDetailApiModel> versionDetails;

  const LocationAreaEncounterApiModel({
    required this.locationArea,
    required this.versionDetails,
  });
}

class LocationAreaEncounterApiModelMapper extends Mapper<LocationAreaEncounterApiModel> {
  @override
  LocationAreaEncounterApiModel fromMap(Map<String, dynamic>? map) {
    return LocationAreaEncounterApiModel(
      locationArea: LocationAreaApiResource.mapper.fromMap(map?['location_area']),
      versionDetails: VersionEncounterDetailApiModel.mapper.fromList(map?['version_details']),
    );
  }

  @override
  Map<String, dynamic> toMap(LocationAreaEncounterApiModel value) {
    return {
      'location_area': LocationAreaApiResource.mapper.toMap(value.locationArea),
      'version_details': VersionEncounterDetailApiModel.mapper.toList(value.versionDetails),
    };
  }
}

import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class LocationAreaApiModel extends ApiModel {
  static var mapper = LocationAreaApiModelMapper();

  final int id;

  final String name;

  final int gameIndex;

  final List<EncounterMethodRateApiModel> encounterMethodRates;

  final LocationApiResource location;

  final List<NameApiModel> names;

  final List<PokemonEncounterApiModel> pokemonEncounters;

  const LocationAreaApiModel({
    required this.id,
    required this.name,
    required this.gameIndex,
    required this.encounterMethodRates,
    required this.location,
    required this.names,
    required this.pokemonEncounters,
  });
}

class LocationAreaApiModelMapper extends Mapper<LocationAreaApiModel> {
  @override
  LocationAreaApiModel fromMap(Map<String, dynamic>? map) {
    return LocationAreaApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      gameIndex: map?['game_index'] ?? 0,
      encounterMethodRates: EncounterMethodRateApiModel.mapper.fromList(map?['encounter_method_rates']),
      location: LocationApiResource.mapper.fromMap(map?['location']),
      names: NameApiModel.mapper.fromList(map?['names']),
      pokemonEncounters: PokemonEncounterApiModel.mapper.fromList(map?['pokemon_encounters']),
    );
  }

  @override
  Map<String, dynamic> toMap(LocationAreaApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'game_index': value.gameIndex,
      'encounter_method_rates': EncounterMethodRateApiModel.mapper.toList(value.encounterMethodRates),
      'location': LocationApiResource.mapper.toMap(value.location),
      'names': NameApiModel.mapper.toList(value.names),
      'pokemon_encounters': PokemonEncounterApiModel.mapper.toList(value.pokemonEncounters),
    };
  }
}

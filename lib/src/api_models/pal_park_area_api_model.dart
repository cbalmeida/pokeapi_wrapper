import '../api_models.dart';
import '../core.dart';

class PalParkAreaApiModel extends ApiModel {
  static var mapper = PalParkAreaApiModelMapper();

  final int id;

  final String name;

  final List<NameApiModel> names;

  final List<PalParkEncounterSpeciesApiModel> pokemonEncounters;

  const PalParkAreaApiModel({
    required this.id,
    required this.name,
    required this.names,
    required this.pokemonEncounters,
  });
}

class PalParkAreaApiModelMapper extends Mapper<PalParkAreaApiModel> {
  @override
  PalParkAreaApiModel fromMap(Map<String, dynamic>? map) {
    return PalParkAreaApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      names: NameApiModel.mapper.fromList(map?['names']),
      pokemonEncounters: PalParkEncounterSpeciesApiModel.mapper.fromList(map?['pokemon_encounters']),
    );
  }

  @override
  Map<String, dynamic> toMap(PalParkAreaApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'names': NameApiModel.mapper.toList(value.names),
      'pokemon_encounters': PalParkEncounterSpeciesApiModel.mapper.toList(value.pokemonEncounters),
    };
  }
}

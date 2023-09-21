import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class PokemonEncounterApiModel extends ApiModel {
  static var mapper = PokemonEncounterApiModelMapper();

  final PokemonApiResource pokemon;

  final List<VersionEncounterDetailApiModel> versionDetails;

  const PokemonEncounterApiModel({
    required this.pokemon,
    required this.versionDetails,
  });
}

class PokemonEncounterApiModelMapper extends Mapper<PokemonEncounterApiModel> {
  @override
  PokemonEncounterApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonEncounterApiModel(
      pokemon: PokemonApiResource.mapper.fromMap(map?['pokemon']),
      versionDetails: VersionEncounterDetailApiModel.mapper.fromList(map?['version_details']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonEncounterApiModel value) {
    return {
      'pokemon': PokemonApiResource.mapper.toMap(value.pokemon),
      'version_details': VersionEncounterDetailApiModel.mapper.toList(value.versionDetails),
    };
  }
}

import '../../pokeapi_wrapper.dart';

class PokemonSpeciesVarietyApiModel extends ApiModel {
  static var mapper = PokemonSpeciesVarietyApiModelMapper();

  final bool isDefault;

  final PokemonApiResource pokemon;

  const PokemonSpeciesVarietyApiModel({
    required this.isDefault,
    required this.pokemon,
  });
}

class PokemonSpeciesVarietyApiModelMapper extends Mapper<PokemonSpeciesVarietyApiModel> {
  @override
  PokemonSpeciesVarietyApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonSpeciesVarietyApiModel(
      isDefault: map?['is_default'] ?? false,
      pokemon: PokemonApiResource.mapper.fromMap(map?['pokemon']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonSpeciesVarietyApiModel value) {
    return {
      'is_default': value.isDefault,
      'pokemon': PokemonApiResource.mapper.toMap(value.pokemon),
    };
  }
}

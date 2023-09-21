import '../../pokeapi_wrapper.dart';

class AbilityPokemonApiModel extends ApiModel {
  static var mapper = AbilityPokemonApiModelMapper();

  final bool isHidden;

  final int slot;

  final PokemonApiResource pokemon;

  const AbilityPokemonApiModel({
    required this.isHidden,
    required this.slot,
    required this.pokemon,
  });
}

class AbilityPokemonApiModelMapper extends Mapper<AbilityPokemonApiModel> {
  @override
  AbilityPokemonApiModel fromMap(Map<String, dynamic>? map) {
    return AbilityPokemonApiModel(
      isHidden: map?['is_hidden'] ?? false,
      slot: map?['slot'] ?? 0,
      pokemon: PokemonApiResource.mapper.fromMap(map?['pokemon']),
    );
  }

  @override
  Map<String, dynamic> toMap(AbilityPokemonApiModel value) {
    return {
      'is_hidden': value.isHidden,
      'slot': value.slot,
      'pokemon': PokemonApiResource.mapper.toMap(value.pokemon),
    };
  }
}

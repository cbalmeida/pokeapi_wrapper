import '../../pokeapi_wrapper.dart';

class PokemonAbilityApiModel extends ApiModel {
  static var mapper = PokemonAbilityApiModelMapper();

  final bool isHidden;

  final int slot;

  final AbilityApiResource ability;

  const PokemonAbilityApiModel({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });
}

class PokemonAbilityApiModelMapper extends Mapper<PokemonAbilityApiModel> {
  @override
  PokemonAbilityApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonAbilityApiModel(
      isHidden: map?['is_hidden'] ?? false,
      slot: map?['slot'] ?? 0,
      ability: AbilityApiResource.mapper.fromMap(map?['ability']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonAbilityApiModel value) {
    return {
      'is_hidden': value.isHidden,
      'slot': value.slot,
      'ability': AbilityApiResource.mapper.toMap(value.ability),
    };
  }
}

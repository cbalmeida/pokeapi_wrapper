import '../../pokeapi_wrapper.dart';

class TypePokemonApiModel extends ApiModel {
  static var mapper = TypePokemonApiModelMapper();

  final int slot;

  final PokemonApiResource pokemon;

  const TypePokemonApiModel({
    required this.slot,
    required this.pokemon,
  });
}

class TypePokemonApiModelMapper extends Mapper<TypePokemonApiModel> {
  @override
  TypePokemonApiModel fromMap(Map<String, dynamic>? map) {
    return TypePokemonApiModel(
      slot: map?['slot'] ?? 0,
      pokemon: PokemonApiResource.mapper.fromMap(map?['pokemon']),
    );
  }

  @override
  Map<String, dynamic> toMap(TypePokemonApiModel value) {
    return {
      'slot': value.slot,
      'pokemon': PokemonApiResource.mapper.toMap(value.pokemon),
    };
  }
}

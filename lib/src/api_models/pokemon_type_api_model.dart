import '../../pokeapi_wrapper.dart';

class PokemonTypeApiModel extends ApiModel {
  static var mapper = PokemonTypeApiModelMapper();

  final int slot;

  final TypeApiResource type;

  const PokemonTypeApiModel({
    required this.slot,
    required this.type,
  });
}

class PokemonTypeApiModelMapper extends Mapper<PokemonTypeApiModel> {
  @override
  PokemonTypeApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonTypeApiModel(
      slot: map?['slot'] ?? 0,
      type: TypeApiResource.mapper.fromMap(map?['type']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonTypeApiModel value) {
    return {
      'slot': value.slot,
      'type': TypeApiResource.mapper.toMap(value.type),
    };
  }
}

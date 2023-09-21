import '../../pokeapi_wrapper.dart';

class PokemonFormTypeApiModel extends ApiModel {
  static var mapper = PokemonFormTypeApiModelMapper();

  final int slot;

  final TypeApiResource type;

  const PokemonFormTypeApiModel({
    required this.slot,
    required this.type,
  });
}

class PokemonFormTypeApiModelMapper extends Mapper<PokemonFormTypeApiModel> {
  @override
  PokemonFormTypeApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonFormTypeApiModel(
      slot: map?['slot'] ?? 0,
      type: TypeApiResource.mapper.fromMap(map?['type']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonFormTypeApiModel value) {
    return {
      'slot': value.slot,
      'type': TypeApiResource.mapper.toMap(value.type),
    };
  }
}

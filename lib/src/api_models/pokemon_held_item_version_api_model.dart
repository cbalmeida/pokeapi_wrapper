import '../../pokeapi_wrapper.dart';

class PokemonHeldItemVersionApiModel {
  static var mapper = PokemonHeldItemVersionApiModelMapper();

  final VersionApiResource version;

  final int rarity;

  const PokemonHeldItemVersionApiModel({
    required this.version,
    required this.rarity,
  });
}

class PokemonHeldItemVersionApiModelMapper extends Mapper<PokemonHeldItemVersionApiModel> {
  @override
  PokemonHeldItemVersionApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonHeldItemVersionApiModel(
      version: VersionApiResource.mapper.fromMap(map?['version']),
      rarity: map?['rarity'] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonHeldItemVersionApiModel value) {
    return {
      'version': VersionApiResource.mapper.toMap(value.version),
      'rarity': value.rarity,
    };
  }
}

import '../../pokeapi_wrapper.dart';

class PokemonSpeciesDexEntryApiModel {
  static var mapper = PokemonSpeciesDexEntryApiModelMapper();

  final int entryNumber;

  final PokedexApiResource pokedex;

  const PokemonSpeciesDexEntryApiModel({
    required this.entryNumber,
    required this.pokedex,
  });
}

class PokemonSpeciesDexEntryApiModelMapper extends Mapper<PokemonSpeciesDexEntryApiModel> {
  @override
  PokemonSpeciesDexEntryApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonSpeciesDexEntryApiModel(
      entryNumber: map?['entry_number'] ?? 0,
      pokedex: PokedexApiResource.mapper.fromMap(map?['pokedex']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonSpeciesDexEntryApiModel value) {
    return {
      'entry_number': value.entryNumber,
      'pokedex': PokedexApiResource.mapper.toMap(value.pokedex),
    };
  }
}

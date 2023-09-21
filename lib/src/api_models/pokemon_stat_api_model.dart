import '../../pokeapi_wrapper.dart';

class PokemonStatApiModel extends ApiModel {
  static var mapper = PokemonStatApiModelMapper();

  final StatApiResource stat;

  final int effort;

  final int baseStat;

  const PokemonStatApiModel({
    required this.stat,
    required this.effort,
    required this.baseStat,
  });
}

class PokemonStatApiModelMapper extends Mapper<PokemonStatApiModel> {
  @override
  PokemonStatApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonStatApiModel(
      stat: StatApiResource.mapper.fromMap(map?['stat']),
      effort: map?['effort'] ?? 0,
      baseStat: map?['base_stat'] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonStatApiModel value) {
    return {
      'stat': StatApiResource.mapper.toMap(value.stat),
      'effort': value.effort,
      'base_stat': value.baseStat,
    };
  }
}

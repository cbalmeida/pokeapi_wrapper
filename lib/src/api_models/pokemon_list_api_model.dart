import '../../pokeapi_wrapper.dart';

class PokemonListApiModel extends ApiModel {
  static var mapper = PokemonListApiModelMapper();

  final int count;

  final String next;

  final String previous;

  final List<PokemonApiResource> results;

  const PokemonListApiModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}

class PokemonListApiModelMapper extends Mapper<PokemonListApiModel> {
  @override
  PokemonListApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonListApiModel(
      count: map?['count'] ?? 0,
      next: map?['next'] ?? '',
      previous: map?['previous'] ?? '',
      results: PokemonApiResource.mapper.fromList(map?['results']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonListApiModel value) {
    return {
      'count': value.count,
      'next': value.next,
      'previous': value.previous,
      'results': PokemonApiResource.mapper.toList(value.results),
    };
  }
}

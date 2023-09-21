import '../../pokeapi_wrapper.dart';
import 'generation_game_index_api_model.dart';
import 'name_api_model.dart';
import 'type_pokemon_api_model.dart';
import 'type_relations_api_model.dart';
import 'type_relations_past_api_model.dart';

class TypeApiModel extends ApiModel {
  static var mapper = TypeApiModelMapper();

  final int id;

  final String name;

  final TypeRelationsApiModel damageRelations;

  final List<TypeRelationsPastApiModel> pastDamageRelations;

  final List<GenerationGameIndexApiModel> gameIndices;

  final GenerationApiResource generation;

  final MoveDamageClassApiResource moveDamageClass;

  final List<NameApiModel> names;

  final List<TypePokemonApiModel> pokemon;

  final List<MoveApiResource> moves;

  const TypeApiModel({
    required this.id,
    required this.name,
    required this.damageRelations,
    required this.pastDamageRelations,
    required this.gameIndices,
    required this.generation,
    required this.moveDamageClass,
    required this.names,
    required this.pokemon,
    required this.moves,
  });
}

class TypeApiModelMapper extends Mapper<TypeApiModel> {
  @override
  TypeApiModel fromMap(Map<String, dynamic>? map) {
    return TypeApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      damageRelations: TypeRelationsApiModel.mapper.fromMap(map?['damage_relations']),
      pastDamageRelations: TypeRelationsPastApiModel.mapper.fromList(map?['past_damage_relations']),
      gameIndices: GenerationGameIndexApiModel.mapper.fromList(map?['game_indices']),
      generation: GenerationApiResource.mapper.fromMap(map?['generation']),
      moveDamageClass: MoveDamageClassApiResource.mapper.fromMap(map?['move_damage_class']),
      names: NameApiModel.mapper.fromList(map?['names']),
      pokemon: TypePokemonApiModel.mapper.fromList(map?['pokemon']),
      moves: MoveApiResource.mapper.fromList(map?['moves']),
    );
  }

  @override
  Map<String, dynamic> toMap(TypeApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'damage_relations': TypeRelationsApiModel.mapper.toMap(value.damageRelations),
      'past_damage_relations': TypeRelationsPastApiModel.mapper.toList(value.pastDamageRelations),
      'game_indices': GenerationGameIndexApiModel.mapper.toList(value.gameIndices),
      'generation': GenerationApiResource.mapper.toMap(value.generation),
      'move_damage_class': MoveDamageClassApiResource.mapper.toMap(value.moveDamageClass),
      'names': NameApiModel.mapper.toList(value.names),
      'pokemon': TypePokemonApiModel.mapper.toList(value.pokemon),
      'moves': MoveApiResource.mapper.toList(value.moves),
    };
  }
}

import '../../pokeapi_wrapper.dart';
import 'type_relations_api_model.dart';

class TypeRelationsPastApiModel extends ApiModel {
  static var mapper = TypeRelationsPastApiModelMapper();

  final GenerationApiResource generation;

  final TypeRelationsApiModel damageRelations;

  const TypeRelationsPastApiModel({
    required this.generation,
    required this.damageRelations,
  });
}

class TypeRelationsPastApiModelMapper extends Mapper<TypeRelationsPastApiModel> {
  @override
  TypeRelationsPastApiModel fromMap(Map<String, dynamic>? map) {
    return TypeRelationsPastApiModel(
      generation: GenerationApiResource.mapper.fromMap(map?['generation']),
      damageRelations: TypeRelationsApiModel.mapper.fromMap(map?['damage_relations']),
    );
  }

  @override
  Map<String, dynamic> toMap(TypeRelationsPastApiModel value) {
    return {
      'generation': GenerationApiResource.mapper.toMap(value.generation),
      'damage_relations': TypeRelationsApiModel.mapper.toMap(value.damageRelations),
    };
  }
}

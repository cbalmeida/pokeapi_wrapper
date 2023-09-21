import '../../pokeapi_wrapper.dart';

class TypeRelationsApiModel extends ApiModel {
  static var mapper = TypeRelationsApiModelMapper();

  final List<TypeApiResource> noDamageTo;

  final List<TypeApiResource> halfDamageTo;

  final List<TypeApiResource> doubleDamageTo;

  final List<TypeApiResource> noDamageFrom;

  final List<TypeApiResource> halfDamageFrom;

  final List<TypeApiResource> doubleDamageFrom;

  const TypeRelationsApiModel({
    required this.noDamageTo,
    required this.halfDamageTo,
    required this.doubleDamageTo,
    required this.noDamageFrom,
    required this.halfDamageFrom,
    required this.doubleDamageFrom,
  });
}

class TypeRelationsApiModelMapper extends Mapper<TypeRelationsApiModel> {
  @override
  TypeRelationsApiModel fromMap(Map<String, dynamic>? map) {
    return TypeRelationsApiModel(
      noDamageTo: TypeApiResource.mapper.fromList(map?['no_damage_to']),
      halfDamageTo: TypeApiResource.mapper.fromList(map?['half_damage_to']),
      doubleDamageTo: TypeApiResource.mapper.fromList(map?['double_damage_to']),
      noDamageFrom: TypeApiResource.mapper.fromList(map?['no_damage_from']),
      halfDamageFrom: TypeApiResource.mapper.fromList(map?['half_damage_from']),
      doubleDamageFrom: TypeApiResource.mapper.fromList(map?['double_damage_from']),
    );
  }

  @override
  Map<String, dynamic> toMap(TypeRelationsApiModel value) {
    return {
      'no_damage_to': TypeApiResource.mapper.toList(value.noDamageTo),
      'half_damage_to': TypeApiResource.mapper.toList(value.halfDamageTo),
      'double_damage_to': TypeApiResource.mapper.toList(value.doubleDamageTo),
      'no_damage_from': TypeApiResource.mapper.toList(value.noDamageFrom),
      'half_damage_from': TypeApiResource.mapper.toList(value.halfDamageFrom),
      'double_damage_from': TypeApiResource.mapper.toList(value.doubleDamageFrom),
    };
  }
}

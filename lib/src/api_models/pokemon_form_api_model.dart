import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class PokemonFormApiModel extends ApiModel {
  static var mapper = PokemonFormApiModelMapper();

  final int id;

  final String name;

  final int order;

  final int formOrder;

  final bool isDefault;

  final bool isBattleOnly;

  final bool isMega;

  final String formName;

  final PokemonApiResource pokemon;

  final List<PokemonFormTypeApiModel> types;

  final PokemonFormSpritesApiModel sprites;

  final VersionGroupApiResource versionGroup;

  final List<NameApiModel> names;

  final List<NameApiModel> formNames;

  const PokemonFormApiModel({
    required this.id,
    required this.name,
    required this.order,
    required this.formOrder,
    required this.isDefault,
    required this.isBattleOnly,
    required this.isMega,
    required this.formName,
    required this.pokemon,
    required this.types,
    required this.sprites,
    required this.versionGroup,
    required this.names,
    required this.formNames,
  });
}

class PokemonFormApiModelMapper extends Mapper<PokemonFormApiModel> {
  @override
  PokemonFormApiModel fromMap(Map<String, dynamic>? map) {
    return PokemonFormApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      order: map?['order'] ?? 0,
      formOrder: map?['form_order'] ?? 0,
      isDefault: map?['is_default'] ?? false,
      isBattleOnly: map?['is_battle_only'] ?? false,
      isMega: map?['is_mega'] ?? false,
      formName: map?['form_name'] ?? '',
      pokemon: PokemonApiResource.mapper.fromMap(map?['pokemon']),
      types: PokemonFormTypeApiModel.mapper.fromList(map?['types']),
      sprites: PokemonFormSpritesApiModel.mapper.fromMap(map?['sprites']),
      versionGroup: VersionGroupApiResource.mapper.fromMap(map?['version_group']),
      names: NameApiModel.mapper.fromList(map?['names']),
      formNames: NameApiModel.mapper.fromList(map?['form_names']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokemonFormApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'order': value.order,
      'form_order': value.formOrder,
      'is_default': value.isDefault,
      'is_battle_only': value.isBattleOnly,
      'is_mega': value.isMega,
      'form_name': value.formName,
      'pokemon': PokemonApiResource.mapper.toMap(value.pokemon),
      'types': PokemonFormTypeApiModel.mapper.toList(value.types),
      'sprites': PokemonFormSpritesApiModel.mapper.toMap(value.sprites),
      'version_group': VersionGroupApiResource.mapper.toMap(value.versionGroup),
      'names': NameApiModel.mapper.toList(value.names),
      'form_names': NameApiModel.mapper.toList(value.formNames),
    };
  }
}

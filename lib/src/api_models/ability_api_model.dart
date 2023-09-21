import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class AbilityApiModel extends ApiModel {
  static var mapper = AbilityApiModelMapper();

  final int id;

  final String name;

  final bool isMainSeries;

  final GenerationApiResource generation;

  final List<NameApiModel> names;

  final List<VerboseEffectApiModel> effectEntries;

  final List<AbilityEffectChangeApiModel> effectChanges;

  final List<AbilityFlavorTextApiModel> flavorTextEntries;

  final List<AbilityPokemonApiModel> pokemon;

  const AbilityApiModel({
    required this.id,
    required this.name,
    required this.isMainSeries,
    required this.generation,
    required this.names,
    required this.effectEntries,
    required this.effectChanges,
    required this.flavorTextEntries,
    required this.pokemon,
  });
}

class AbilityApiModelMapper extends Mapper<AbilityApiModel> {
  @override
  AbilityApiModel fromMap(Map<String, dynamic>? map) {
    return AbilityApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      isMainSeries: map?['is_main_series'] ?? false,
      generation: GenerationApiResource.mapper.fromMap(map?['generation']),
      names: NameApiModel.mapper.fromList(map?['names']),
      effectEntries: VerboseEffectApiModel.mapper.fromList(map?['effect_entries']),
      effectChanges: AbilityEffectChangeApiModel.mapper.fromList(map?['effect_changes']),
      flavorTextEntries: AbilityFlavorTextApiModel.mapper.fromList(map?['flavor_text_entries']),
      pokemon: AbilityPokemonApiModel.mapper.fromList(map?['pokemon']),
    );
  }

  @override
  Map<String, dynamic> toMap(AbilityApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'is_main_series': value.isMainSeries,
      'generation': GenerationApiResource.mapper.toMap(value.generation),
      'names': NameApiModel.mapper.toList(value.names),
      'effect_entries': VerboseEffectApiModel.mapper.toList(value.effectEntries),
      'effect_changes': AbilityEffectChangeApiModel.mapper.toList(value.effectChanges),
      'flavor_text_entries': AbilityFlavorTextApiModel.mapper.toList(value.flavorTextEntries),
      'pokemon': AbilityPokemonApiModel.mapper.toList(value.pokemon),
    };
  }
}

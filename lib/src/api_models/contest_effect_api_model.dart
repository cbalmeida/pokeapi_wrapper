import '../api_models.dart';
import '../core.dart';

class ContestEffectApiModel extends ApiModel {
  static var mapper = ContestEffectApiModelMapper();

  final int id;

  final int appeal;

  final int jam;

  final List<EffectApiModel> effectEntries;

  final List<FlavorTextApiModel> flavorTextEntries;

  const ContestEffectApiModel({
    required this.id,
    required this.appeal,
    required this.jam,
    required this.effectEntries,
    required this.flavorTextEntries,
  });
}

class ContestEffectApiModelMapper extends Mapper<ContestEffectApiModel> {
  @override
  ContestEffectApiModel fromMap(Map<String, dynamic>? map) {
    return ContestEffectApiModel(
      id: map?['id'] ?? 0,
      appeal: map?['appeal'] ?? 0,
      jam: map?['jam'] ?? 0,
      effectEntries: EffectApiModel.mapper.fromList(map?['effect_entries']),
      flavorTextEntries: FlavorTextApiModel.mapper.fromList(map?['flavor_text_entries']),
    );
  }

  @override
  Map<String, dynamic> toMap(ContestEffectApiModel value) {
    return {
      'id': value.id,
      'appeal': value.appeal,
      'jam': value.jam,
      'effect_entries': EffectApiModel.mapper.toList(value.effectEntries),
      'flavor_text_entries': FlavorTextApiModel.mapper.toList(value.flavorTextEntries),
    };
  }
}

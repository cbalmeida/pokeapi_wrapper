import '../api_models.dart';
import '../core.dart';
import '../models.dart';

class AbilityEffectChangeApiModel extends ApiModel {
  static var mapper = AbilityEffectChangeApiModelMapper();

  final List<EffectApiModel> effectEntries;

  final VersionGroupApiResource versionGroup;

  const AbilityEffectChangeApiModel({
    required this.effectEntries,
    required this.versionGroup,
  });
}

class AbilityEffectChangeApiModelMapper extends Mapper<AbilityEffectChangeApiModel> {
  @override
  AbilityEffectChangeApiModel fromMap(Map<String, dynamic>? map) {
    return AbilityEffectChangeApiModel(
      effectEntries: EffectApiModel.mapper.fromList(map?['effect_entries']),
      versionGroup: VersionGroupApiResource.mapper.fromMap(map?['version_group']),
    );
  }

  @override
  Map<String, dynamic> toMap(AbilityEffectChangeApiModel value) {
    return {
      'effect_entries': EffectApiModel.mapper.toList(value.effectEntries),
      'version_group': VersionGroupApiResource.mapper.toMap(value.versionGroup),
    };
  }
}

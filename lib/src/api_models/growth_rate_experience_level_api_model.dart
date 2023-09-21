import '../core.dart';

class GrowthRateExperienceLevelApiModel {
  static var mapper = GrowthRateExperienceLevelApiModelMapper();

  final int level;

  final int experience;

  const GrowthRateExperienceLevelApiModel({
    required this.level,
    required this.experience,
  });
}

class GrowthRateExperienceLevelApiModelMapper extends Mapper<GrowthRateExperienceLevelApiModel> {
  @override
  GrowthRateExperienceLevelApiModel fromMap(Map<String, dynamic>? map) {
    return GrowthRateExperienceLevelApiModel(
      level: map?['level'] ?? 0,
      experience: map?['experience'] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toMap(GrowthRateExperienceLevelApiModel value) {
    return {
      'level': value.level,
      'experience': value.experience,
    };
  }
}

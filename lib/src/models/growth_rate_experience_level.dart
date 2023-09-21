import '../api_models.dart';
import '../core.dart';
import '../services.dart';

class GrowthRateExperienceLevel extends Model<GrowthRateExperienceLevelApiModel> {
  static var adapter = GrowthRateExperienceLevelAdapter();

  const GrowthRateExperienceLevel({required super.service, required super.apiModel});

  /// The level gained.
  int get level => apiModel.level;

  /// The amount of experience required to reach the referenced level.
  int get experience => apiModel.experience;
}

class GrowthRateExperienceLevelAdapter extends ApiModelAdapter<GrowthRateExperienceLevelApiModel, GrowthRateExperienceLevel> {
  @override
  GrowthRateExperienceLevel createModelFromApiModel({required IService service, required GrowthRateExperienceLevelApiModel apiModel}) {
    return GrowthRateExperienceLevel(service: service, apiModel: apiModel);
  }
}

class GrowthRateExperienceLevelApiResource extends ApiResource {
  const GrowthRateExperienceLevelApiResource({required super.url});

  static get mapper => GrowthRateExperienceLevelApiResourceMapper();
}

class GrowthRateExperienceLevelApiResourceMapper extends ApiResourceMapper<GrowthRateExperienceLevelApiResource> {
  @override
  GrowthRateExperienceLevelApiResource fromUrl(String url) {
    return GrowthRateExperienceLevelApiResource(url: url);
  }
}

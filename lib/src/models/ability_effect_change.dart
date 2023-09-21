import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class AbilityEffectChange extends Model<AbilityEffectChangeApiModel> {
  static var adapter = AbilityEffectChangeAdapter();

  const AbilityEffectChange({required super.service, required super.apiModel});

  /// The previous effect of this ability listed in different languages.
  List<Effect> get effectEntries => Effect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.effectEntries);

  /// The version group in which the previous effect of this ability originated.
  Future<Either<Error, VersionGroup>> get versionGroup => VersionGroup.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.versionGroup);
}

class AbilityEffectChangeAdapter extends ApiModelAdapter<AbilityEffectChangeApiModel, AbilityEffectChange> {
  @override
  AbilityEffectChange createModelFromApiModel({required IService service, required AbilityEffectChangeApiModel apiModel}) {
    return AbilityEffectChange(service: service, apiModel: apiModel);
  }
}

class AbilityEffectChangeApiResource extends ApiResource {
  const AbilityEffectChangeApiResource({required super.url});

  static get mapper => AbilityEffectChangeApiResourceMapper();
}

class AbilityEffectChangeApiResourceMapper extends ApiResourceMapper<AbilityEffectChangeApiResource> {
  @override
  AbilityEffectChangeApiResource fromUrl(String url) {
    return AbilityEffectChangeApiResource(url: url);
  }
}

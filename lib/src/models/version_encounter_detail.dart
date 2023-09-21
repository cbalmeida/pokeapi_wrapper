import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class VersionEncounterDetail extends Model<VersionEncounterDetailApiModel> {
  static var adapter = VersionEncounterDetailAdapter();

  const VersionEncounterDetail({required super.service, required super.apiModel});

  /// The game version this encounter happens in.
  Future<Either<Error, Version>> get version => Version.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.version);

  /// The total percentage of all encounter potential.
  int get maxChance => apiModel.maxChance;

  /// A list of encounters and their specifics.
  List<Encounter> get encounterDetails => Encounter.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.encounterDetails);
}

class VersionEncounterDetailAdapter extends ApiModelAdapter<VersionEncounterDetailApiModel, VersionEncounterDetail> {
  @override
  VersionEncounterDetail createModelFromApiModel({required IService service, required VersionEncounterDetailApiModel apiModel}) {
    return VersionEncounterDetail(service: service, apiModel: apiModel);
  }
}

class VersionEncounterDetailApiResource extends ApiResource {
  const VersionEncounterDetailApiResource({required super.url});

  static get mapper => VersionEncounterDetailApiResourceMapper();
}

class VersionEncounterDetailApiResourceMapper extends ApiResourceMapper<VersionEncounterDetailApiResource> {
  @override
  VersionEncounterDetailApiResource fromUrl(String url) {
    return VersionEncounterDetailApiResource(url: url);
  }
}

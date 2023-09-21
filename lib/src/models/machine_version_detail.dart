import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MachineVersionDetail extends Model<MachineVersionDetailApiModel> {
  static var adapter = MachineVersionDetailAdapter();

  const MachineVersionDetail({required super.service, required super.apiModel});

  /// The machine that teaches a move from an item.
  Future<Either<Error, Machine>> get machine => Machine.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.machine);

  /// The version group of this specific machine.
  Future<Either<Error, VersionGroup>> get versionGroup => VersionGroup.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.versionGroup);
}

class MachineVersionDetailAdapter extends ApiModelAdapter<MachineVersionDetailApiModel, MachineVersionDetail> {
  @override
  MachineVersionDetail createModelFromApiModel({required IService service, required MachineVersionDetailApiModel apiModel}) {
    return MachineVersionDetail(service: service, apiModel: apiModel);
  }
}

class MachineVersionDetailApiResource extends ApiResource {
  const MachineVersionDetailApiResource({required super.url});

  static get mapper => MachineVersionDetailApiResourceMapper();
}

class MachineVersionDetailApiResourceMapper extends ApiResourceMapper<MachineVersionDetailApiResource> {
  @override
  MachineVersionDetailApiResource fromUrl(String url) {
    return MachineVersionDetailApiResource(url: url);
  }
}

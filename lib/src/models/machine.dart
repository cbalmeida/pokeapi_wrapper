import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Machine extends Model<MachineApiModel> {
  static var adapter = MachineAdapter();

  const Machine({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The TM or HM item that corresponds to this machine.
  Future<Either<Error, Item>> get item => Item.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.item);

  /// The move that is taught by this machine.
  Future<Either<Error, Move>> get move => Move.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.move);

  /// The version group that this machine applies to.
  Future<Either<Error, VersionGroup>> get versionGroup => VersionGroup.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.versionGroup);
}

class MachineAdapter extends ApiResourceAdapter<MachineApiModel, Machine, MachineApiResource> {
  @override
  Future<Either<Error, MachineApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getMachine(apiResource.url);
  }

  @override
  Machine createModelFromApiModel({required IService service, required MachineApiModel apiModel}) {
    return Machine(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/machine';

  @override
  Future<Either<Error, List<MachineApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getMachineList(offSet: offSet, limit: limit);
  }
}

class MachineApiResource extends ApiResource {
  const MachineApiResource({required super.url});

  static get mapper => MachineApiResourceMapper();
}

class MachineApiResourceMapper extends ApiResourceMapper<MachineApiResource> {
  @override
  MachineApiResource fromUrl(String url) {
    return MachineApiResource(url: url);
  }
}

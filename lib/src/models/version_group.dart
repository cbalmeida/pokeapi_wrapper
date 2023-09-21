import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class VersionGroup extends Model<VersionGroupApiModel> {
  static var adapter = VersionGroupAdapter();

  const VersionGroup({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// Order for sorting. Almost by date of release, except similar versions are grouped together.
  int get order => apiModel.order;

  /// The generation this version was introduced in.
  Future<Either<Error, Generation>> get generation => Generation.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.generation);

  /// A list of methods in which Pokémon can learn moves in this version group.
  Future<Either<Error, List<MoveLearnMethod>>> get moveLearnMethods => MoveLearnMethod.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.moveLearnMethods);

  /// A list of Pokédexes introduces in this version group.
  Future<Either<Error, List<Pokedex>>> get pokedexes => Pokedex.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.pokedexes);

  /// A list of regions that can be visited in this version group.
  Future<Either<Error, List<Region>>> get regions => Region.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.regions);

  /// The versions this version group owns.
  Future<Either<Error, List<Version>>> get versions => Version.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.versions);
}

class VersionGroupAdapter extends ApiResourceAdapter<VersionGroupApiModel, VersionGroup, VersionGroupApiResource> {
  @override
  Future<Either<Error, VersionGroupApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getVersionGroup(apiResource.url);
  }

  @override
  VersionGroup createModelFromApiModel({required IService service, required VersionGroupApiModel apiModel}) {
    return VersionGroup(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/version-group';

  @override
  Future<Either<Error, List<VersionGroupApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getVersionGroupList(offSet: offSet, limit: limit);
  }
}

class VersionGroupApiResource extends ApiResource {
  const VersionGroupApiResource({required super.url});

  static get mapper => VersionGroupApiResourceMapper();
}

class VersionGroupApiResourceMapper extends ApiResourceMapper<VersionGroupApiResource> {
  @override
  VersionGroupApiResource fromUrl(String url) {
    return VersionGroupApiResource(url: url);
  }
}

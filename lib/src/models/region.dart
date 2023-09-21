import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Region extends Model<RegionApiModel> {
  static var adapter = RegionAdapter();

  const Region({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// A list of locations that can be found in this region.
  Future<Either<Error, List<Location>>> get locations => Location.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.locations);

  /// The name for this resource.
  String get name => apiModel.name;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// The generation this region was introduced in.
  Future<Either<Error, Generation>> get mainGeneration => Generation.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.mainGeneration);

  /// A list of pokédexes that catalogue Pokémon in this region.
  Future<Either<Error, List<Pokedex>>> get pokedexes => Pokedex.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.pokedexes);

  /// A list of version groups where this region can be visited.
  Future<Either<Error, List<VersionGroup>>> get versionGroups => VersionGroup.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.versionGroups);
}

class RegionAdapter extends ApiResourceAdapter<RegionApiModel, Region, RegionApiResource> {
  @override
  Future<Either<Error, RegionApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getRegion(apiResource.url);
  }

  @override
  Region createModelFromApiModel({required IService service, required RegionApiModel apiModel}) {
    return Region(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/region';

  @override
  Future<Either<Error, List<RegionApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getRegionList(offSet: offSet, limit: limit);
  }
}

class RegionApiResource extends ApiResource {
  const RegionApiResource({required super.url});

  static get mapper => RegionApiResourceMapper();
}

class RegionApiResourceMapper extends ApiResourceMapper<RegionApiResource> {
  @override
  RegionApiResource fromUrl(String url) {
    return RegionApiResource(url: url);
  }
}

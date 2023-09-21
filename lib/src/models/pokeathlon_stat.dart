import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokeathlonStat extends Model<PokeathlonStatApiModel> {
  static var adapter = PokeathlonStatAdapter();

  const PokeathlonStat({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A detail of natures which affect this Pokéathlon stat positively or negatively.
  NaturePokeathlonStatAffectSets get affectingNatures => NaturePokeathlonStatAffectSets.adapter.createModelFromApiModel(service: service, apiModel: apiModel.affectingNatures);
}

class PokeathlonStatAdapter extends ApiResourceAdapter<PokeathlonStatApiModel, PokeathlonStat, PokeathlonStatApiResource> {
  @override
  Future<Either<Error, PokeathlonStatApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getPokeathlonStat(apiResource.url);
  }

  @override
  PokeathlonStat createModelFromApiModel({required IService service, required PokeathlonStatApiModel apiModel}) {
    return PokeathlonStat(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/pokeathlon-stat';

  @override
  Future<Either<Error, List<PokeathlonStatApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getPokeathlonStatList(offSet: offSet, limit: limit);
  }
}

class PokeathlonStatApiResource extends ApiResource {
  const PokeathlonStatApiResource({required super.url});

  static get mapper => PokeathlonStatApiResourceMapper();
}

class PokeathlonStatApiResourceMapper extends ApiResourceMapper<PokeathlonStatApiResource> {
  @override
  PokeathlonStatApiResource fromUrl(String url) {
    return PokeathlonStatApiResource(url: url);
  }
}

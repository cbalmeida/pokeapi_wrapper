import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class EggGroup extends Model<EggGroupApiModel> {
  static var adapter = EggGroupAdapter();

  const EggGroup({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of all Pokémon species that are members of this egg group.
  Future<Either<Error, List<PokemonSpecies>>> get pokemonSpecies => PokemonSpecies.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.pokemonSpecies);
}

class EggGroupAdapter extends ApiResourceAdapter<EggGroupApiModel, EggGroup, EggGroupApiResource> {
  @override
  Future<Either<Error, EggGroupApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getEggGroup(apiResource.url);
  }

  @override
  EggGroup createModelFromApiModel({required IService service, required EggGroupApiModel apiModel}) {
    return EggGroup(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/egg-group';

  @override
  Future<Either<Error, List<EggGroupApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getEggGroupList(offSet: offSet, limit: limit);
  }
}

class EggGroupApiResource extends ApiResource {
  const EggGroupApiResource({required super.url});

  static get mapper => EggGroupApiResourceMapper();
}

class EggGroupApiResourceMapper extends ApiResourceMapper<EggGroupApiResource> {
  @override
  EggGroupApiResource fromUrl(String url) {
    return EggGroupApiResource(url: url);
  }
}

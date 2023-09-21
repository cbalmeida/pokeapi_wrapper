import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Pokedex extends Model<PokedexApiModel> {
  static var adapter = PokedexAdapter();

  const Pokedex({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// Whether or not this Pokédex originated in the main series of the video games.
  bool get isMainSeries => apiModel.isMainSeries;

  /// The description of this resource listed in different languages.
  List<Description> get descriptions => Description.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.descriptions);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of Pokémon catalogued in this Pokédex and their indexes.
  List<PokemonEntry> get pokemonEntries => PokemonEntry.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pokemonEntries);

  /// The region this Pokédex catalogues Pokémon for.
  Future<Either<Error, Region>> get region => Region.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.region);

  /// A list of version groups this Pokédex is relevant to.
  Future<Either<Error, List<VersionGroup>>> get versionGroups => VersionGroup.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.versionGroups);
}

class PokedexAdapter extends ApiResourceAdapter<PokedexApiModel, Pokedex, PokedexApiResource> {
  @override
  Future<Either<Error, PokedexApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getPokedex(apiResource.url);
  }

  @override
  Pokedex createModelFromApiModel({required IService service, required PokedexApiModel apiModel}) {
    return Pokedex(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/pokedex';

  @override
  Future<Either<Error, List<PokedexApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getPokedexList(offSet: offSet, limit: limit);
  }
}

class PokedexApiResource extends ApiResource {
  const PokedexApiResource({required super.url});

  static get mapper => PokedexApiResourceMapper();
}

class PokedexApiResourceMapper extends ApiResourceMapper<PokedexApiResource> {
  @override
  PokedexApiResource fromUrl(String url) {
    return PokedexApiResource(url: url);
  }
}

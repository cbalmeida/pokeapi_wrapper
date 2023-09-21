import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Generation extends Model<GenerationApiModel> {
  static var adapter = GenerationAdapter();

  const Generation({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// A list of abilities that were introduced in this generation.
  Future<Either<Error, List<Ability>>> get abilities => Ability.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.abilities);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// The main region travelled in this generation.
  Future<Either<Error, Region>> get mainRegion => Region.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.mainRegion);

  /// A list of moves that were introduced in this generation.
  Future<Either<Error, List<Move>>> get moves => Move.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.moves);

  /// A list of Pokémon species that were introduced in this generation.
  Future<Either<Error, List<PokemonSpecies>>> get pokemonSpecies => PokemonSpecies.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.pokemonSpecies);

  /// A list of types that were introduced in this generation.
  Future<Either<Error, List<Type>>> get types => Type.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.types);

  /// A list of version groups that were introduced in this generation.
  Future<Either<Error, List<VersionGroup>>> get versionGroups => VersionGroup.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.versionGroups);
}

class GenerationAdapter extends ApiResourceAdapter<GenerationApiModel, Generation, GenerationApiResource> {
  @override
  Future<Either<Error, GenerationApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getGeneration(apiResource.url);
  }

  @override
  Generation createModelFromApiModel({required IService service, required GenerationApiModel apiModel}) {
    return Generation(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/generation';

  @override
  Future<Either<Error, List<GenerationApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getGenerationList(offSet: offSet, limit: limit);
  }
}

class GenerationApiResource extends ApiResource {
  const GenerationApiResource({required super.url});

  static get mapper => GenerationApiResourceMapper();
}

class GenerationApiResourceMapper extends ApiResourceMapper<GenerationApiResource> {
  @override
  GenerationApiResource fromUrl(String url) {
    return GenerationApiResource(url: url);
  }
}

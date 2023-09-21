import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonShape extends Model<PokemonShapeApiModel> {
  static var adapter = PokemonShapeAdapter();

  const PokemonShape({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The "scientific" name of this Pokémon shape listed in different languages.
  List<AwesomeName> get awesomeNames => AwesomeName.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.awesomeNames);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of the Pokémon species that have this shape.
  Future<Either<Error, List<PokemonSpecies>>> get pokemonSpecies => PokemonSpecies.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.pokemonSpecies);
}

class PokemonShapeAdapter extends ApiResourceAdapter<PokemonShapeApiModel, PokemonShape, PokemonShapeApiResource> {
  @override
  Future<Either<Error, PokemonShapeApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getPokemonShape(apiResource.url);
  }

  @override
  PokemonShape createModelFromApiModel({required IService service, required PokemonShapeApiModel apiModel}) {
    return PokemonShape(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/pokemon-shape';

  @override
  Future<Either<Error, List<PokemonShapeApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getPokemonShapeList(offSet: offSet, limit: limit);
  }
}

class PokemonShapeApiResource extends ApiResource {
  const PokemonShapeApiResource({required super.url});

  static get mapper => PokemonShapeApiResourceMapper();
}

class PokemonShapeApiResourceMapper extends ApiResourceMapper<PokemonShapeApiResource> {
  @override
  PokemonShapeApiResource fromUrl(String url) {
    return PokemonShapeApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonHabitat extends Model<PokemonHabitatApiModel> {
  static var adapter = PokemonHabitatAdapter();

  const PokemonHabitat({required super.service, required super.apiModel});

  /// The identifier for this Pokémon habitat resource
  int get id => apiModel.id;

  /// The name for this Pokémon habitat resource
  String get name => apiModel.name;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of the Pokémon species that can be found in this habitat
  Future<Either<Error, List<PokemonSpecies>>> get pokemonSpecies => PokemonSpecies.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.pokemonSpecies);
}

class PokemonHabitatAdapter extends ApiResourceAdapter<PokemonHabitatApiModel, PokemonHabitat, PokemonHabitatApiResource> {
  @override
  Future<Either<Error, PokemonHabitatApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getPokemonHabitat(apiResource.url);
  }

  @override
  PokemonHabitat createModelFromApiModel({required IService service, required PokemonHabitatApiModel apiModel}) {
    return PokemonHabitat(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/pokemon-habitat';

  @override
  Future<Either<Error, List<PokemonHabitatApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getPokemonHabitatList(offSet: offSet, limit: limit);
  }
}

class PokemonHabitatApiResource extends ApiResource {
  const PokemonHabitatApiResource({required super.url});

  static get mapper => PokemonHabitatApiResourceMapper();
}

class PokemonHabitatApiResourceMapper extends ApiResourceMapper<PokemonHabitatApiResource> {
  @override
  PokemonHabitatApiResource fromUrl(String url) {
    return PokemonHabitatApiResource(url: url);
  }
}

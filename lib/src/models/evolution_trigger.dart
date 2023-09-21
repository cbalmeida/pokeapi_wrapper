import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class EvolutionTrigger extends Model<EvolutionTriggerApiModel> {
  static var adapter = EvolutionTriggerAdapter();

  const EvolutionTrigger({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of pokemon species that result from this evolution trigger.
  Future<Either<Error, List<PokemonSpecies>>> get pokemonSpecies => PokemonSpecies.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.pokemonSpecies);
}

class EvolutionTriggerAdapter extends ApiResourceAdapter<EvolutionTriggerApiModel, EvolutionTrigger, EvolutionTriggerApiResource> {
  @override
  Future<Either<Error, EvolutionTriggerApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getEvolutionTrigger(apiResource.url);
  }

  @override
  EvolutionTrigger createModelFromApiModel({required IService service, required EvolutionTriggerApiModel apiModel}) {
    return EvolutionTrigger(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/evolution-trigger';

  @override
  Future<Either<Error, List<EvolutionTriggerApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getEvolutionTriggerList(offSet: offSet, limit: limit);
  }
}

class EvolutionTriggerApiResource extends ApiResource {
  const EvolutionTriggerApiResource({required super.url});

  static get mapper => EvolutionTriggerApiResourceMapper();
}

class EvolutionTriggerApiResourceMapper extends ApiResourceMapper<EvolutionTriggerApiResource> {
  @override
  EvolutionTriggerApiResource fromUrl(String url) {
    return EvolutionTriggerApiResource(url: url);
  }
}

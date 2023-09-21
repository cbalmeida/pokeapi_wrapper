import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class EvolutionChain extends Model<EvolutionChainApiModel> {
  static var adapter = EvolutionChainAdapter();

  const EvolutionChain({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The item that a Pokémon would be holding when mating that would trigger the egg hatching a baby Pokémon rather than a basic Pokémon.
  Future<Either<Error, Item>> get babyTriggerItem => Item.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.babyTriggerItem);

  /// The base chain link object. Each link contains evolution details for a Pokémon in the chain. Each link references the next Pokémon in the natural evolution order.
  ChainLink get chain => ChainLink.adapter.createModelFromApiModel(service: service, apiModel: apiModel.chain);
}

class EvolutionChainAdapter extends ApiResourceAdapter<EvolutionChainApiModel, EvolutionChain, EvolutionChainApiResource> {
  @override
  Future<Either<Error, EvolutionChainApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getEvolutionChain(apiResource.url);
  }

  @override
  EvolutionChain createModelFromApiModel({required IService service, required EvolutionChainApiModel apiModel}) {
    return EvolutionChain(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/evolution-chain';

  @override
  Future<Either<Error, List<EvolutionChainApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getEvolutionChainList(offSet: offSet, limit: limit);
  }
}

class EvolutionChainApiResource extends ApiResource {
  const EvolutionChainApiResource({required super.url});

  static get mapper => EvolutionChainApiResourceMapper();
}

class EvolutionChainApiResourceMapper extends ApiResourceMapper<EvolutionChainApiResource> {
  @override
  EvolutionChainApiResource fromUrl(String url) {
    return EvolutionChainApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ChainLink extends Model<ChainLinkApiModel> {
  static var adapter = ChainLinkAdapter();

  const ChainLink({required super.service, required super.apiModel});

  /// Whether or not this link is for a baby Pokémon. This would only ever be true on the base link.
  bool get isBaby => apiModel.isBaby;

  /// The Pokémon species at this point in the evolution chain.
  Future<Either<Error, PokemonSpecies>> get species => PokemonSpecies.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.species);

  /// All details regarding the specific details of the referenced Pokémon species evolution.
  List<EvolutionDetail> get evolutionDetails => EvolutionDetail.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.evolutionDetails);

  /// A List of chain objects.
  List<ChainLink> get evolvesTo => ChainLink.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.evolvesTo);
}

class ChainLinkAdapter extends ApiModelAdapter<ChainLinkApiModel, ChainLink> {
  @override
  ChainLink createModelFromApiModel({required IService service, required ChainLinkApiModel apiModel}) {
    return ChainLink(service: service, apiModel: apiModel);
  }
}

class ChainLinkApiResource extends ApiResource {
  const ChainLinkApiResource({required super.url});

  static get mapper => ChainLinkApiResourceMapper();
}

class ChainLinkApiResourceMapper extends ApiResourceMapper<ChainLinkApiResource> {
  @override
  ChainLinkApiResource fromUrl(String url) {
    return ChainLinkApiResource(url: url);
  }
}

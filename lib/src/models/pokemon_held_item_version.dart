import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonHeldItemVersion extends Model<PokemonHeldItemVersionApiModel> {
  static var adapter = PokemonHeldItemVersionAdapter();

  const PokemonHeldItemVersion({required super.service, required super.apiModel});

  /// The version in which the item is held.
  Future<Either<Error, Version>> get version => Version.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.version);

  /// How often the item is held.
  int get rarity => apiModel.rarity;
}

class PokemonHeldItemVersionAdapter extends ApiModelAdapter<PokemonHeldItemVersionApiModel, PokemonHeldItemVersion> {
  @override
  PokemonHeldItemVersion createModelFromApiModel({required IService service, required PokemonHeldItemVersionApiModel apiModel}) {
    return PokemonHeldItemVersion(service: service, apiModel: apiModel);
  }
}

class PokemonHeldItemVersionApiResource extends ApiResource {
  const PokemonHeldItemVersionApiResource({required super.url});

  static get mapper => PokemonHeldItemVersionApiResourceMapper();
}

class PokemonHeldItemVersionApiResourceMapper extends ApiResourceMapper<PokemonHeldItemVersionApiResource> {
  @override
  PokemonHeldItemVersionApiResource fromUrl(String url) {
    return PokemonHeldItemVersionApiResource(url: url);
  }
}

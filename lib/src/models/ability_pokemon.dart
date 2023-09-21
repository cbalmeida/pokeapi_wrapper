import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class AbilityPokemon extends Model<AbilityPokemonApiModel> {
  static var adapter = AbilityPokemonAdapter();

  const AbilityPokemon({required super.service, required super.apiModel});

  /// Whether or not this a hidden ability for the referenced Pokémon.
  bool get isHidden => apiModel.isHidden;

  /// Pokémon have 3 ability 'slots' which hold references to possible abilities they could have. This is the slot of this ability for the referenced pokemon.
  int get slot => apiModel.slot;

  /// The Pokémon this ability could belong to.
  Future<Either<Error, Pokemon>> get pokemon => Pokemon.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokemon);
}

class AbilityPokemonAdapter extends ApiModelAdapter<AbilityPokemonApiModel, AbilityPokemon> {
  @override
  AbilityPokemon createModelFromApiModel({required IService service, required AbilityPokemonApiModel apiModel}) {
    return AbilityPokemon(service: service, apiModel: apiModel);
  }
}

class AbilityPokemonApiResource extends ApiResource {
  const AbilityPokemonApiResource({required super.url});

  static get mapper => AbilityPokemonApiResourceMapper();
}

class AbilityPokemonApiResourceMapper extends ApiResourceMapper<AbilityPokemonApiResource> {
  @override
  AbilityPokemonApiResource fromUrl(String url) {
    return AbilityPokemonApiResource(url: url);
  }
}

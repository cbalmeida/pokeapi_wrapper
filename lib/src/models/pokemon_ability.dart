import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonAbility extends Model<PokemonAbilityApiModel> {
  static var adapter = PokemonAbilityAdapter();

  const PokemonAbility({required super.service, required super.apiModel});

  /// Whether or not this is a hidden ability.
  bool get isHidden => apiModel.isHidden;

  /// The slot this ability occupies in this Pokémon species.
  int get slot => apiModel.slot;

  /// The ability the Pokémon may have.
  Future<Either<Error, Ability>> get ability => Ability.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.ability);
}

class PokemonAbilityAdapter extends ApiModelAdapter<PokemonAbilityApiModel, PokemonAbility> {
  @override
  PokemonAbility createModelFromApiModel({required IService service, required PokemonAbilityApiModel apiModel}) {
    return PokemonAbility(service: service, apiModel: apiModel);
  }
}

class PokemonAbilityApiResource extends ApiResource {
  const PokemonAbilityApiResource({required super.url});

  static get mapper => PokemonAbilityApiResourceMapper();
}

class PokemonAbilityApiResourceMapper extends ApiResourceMapper<PokemonAbilityApiResource> {
  @override
  PokemonAbilityApiResource fromUrl(String url) {
    return PokemonAbilityApiResource(url: url);
  }
}

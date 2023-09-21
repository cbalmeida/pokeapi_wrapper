import '../api_models.dart';
import '../core.dart';
import '../services.dart';

class PokemonFormSprites extends Model<PokemonFormSpritesApiModel> {
  static var adapter = PokemonFormSpritesAdapter();

  const PokemonFormSprites({required super.service, required super.apiModel});

  /// The default depiction of this Pokémon form from the front in battle.
  String get frontDefault => apiModel.frontDefault;

  /// The shiny depiction of this Pokémon form from the front in battle.
  String get frontShiny => apiModel.frontShiny;

  /// The default depiction of this Pokémon form from the back in battle.
  String get backDefault => apiModel.backDefault;

  /// The shiny depiction of this Pokémon form from the back in battle.
  String get backShiny => apiModel.backShiny;
}

class PokemonFormSpritesAdapter extends ApiModelAdapter<PokemonFormSpritesApiModel, PokemonFormSprites> {
  @override
  PokemonFormSprites createModelFromApiModel({required IService service, required PokemonFormSpritesApiModel apiModel}) {
    return PokemonFormSprites(service: service, apiModel: apiModel);
  }
}

class PokemonFormSpritesApiResource extends ApiResource {
  const PokemonFormSpritesApiResource({required super.url});

  static get mapper => PokemonFormSpritesApiResourceMapper();
}

class PokemonFormSpritesApiResourceMapper extends ApiResourceMapper<PokemonFormSpritesApiResource> {
  @override
  PokemonFormSpritesApiResource fromUrl(String url) {
    return PokemonFormSpritesApiResource(url: url);
  }
}

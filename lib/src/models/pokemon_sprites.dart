import '../api_models.dart';
import '../core.dart';
import '../services.dart';

class PokemonSprites extends Model<PokemonSpritesApiModel> {
  static var adapter = PokemonSpritesAdapter();

  const PokemonSprites({required super.service, required super.apiModel});

  /// The default depiction of this Pokémon from the front in battle.
  String get frontDefault => apiModel.frontDefault;

  /// The shiny depiction of this Pokémon from the front in battle.
  String get frontShiny => apiModel.frontShiny;

  /// The female depiction of this Pokémon from the front in battle
  String get frontFemale => apiModel.frontFemale;

  /// The shiny female depiction of this Pokémon from the front in battle.
  String get frontShinyFemale => apiModel.frontShinyFemale;

  /// The default depiction of this Pokémon from the back in battle.
  String get backDefault => apiModel.backDefault;

  /// The shiny depiction of this Pokémon from the back in battle.
  String get backShiny => apiModel.backShiny;

  /// The female depiction of this Pokémon from the back in battle.
  String get backFemale => apiModel.backFemale;

  /// The shiny female depiction of this Pokémon from the back in battle.
  String get backShinyFemale => apiModel.backShinyFemale;

  /// This is not in the official documentation (https://pokeapi.co/docs/v2#pokemonsprites) but is in the API response.
  String get officialArtWork => apiModel.officialArtwork;
}

class PokemonSpritesAdapter extends ApiModelAdapter<PokemonSpritesApiModel, PokemonSprites> {
  @override
  PokemonSprites createModelFromApiModel({required IService service, required PokemonSpritesApiModel apiModel}) {
    return PokemonSprites(service: service, apiModel: apiModel);
  }
}

class PokemonSpritesApiResource extends ApiResource {
  const PokemonSpritesApiResource({required super.url});

  static get mapper => PokemonSpritesApiResourceMapper();
}

class PokemonSpritesApiResourceMapper extends ApiResourceMapper<PokemonSpritesApiResource> {
  @override
  PokemonSpritesApiResource fromUrl(String url) {
    return PokemonSpritesApiResource(url: url);
  }
}

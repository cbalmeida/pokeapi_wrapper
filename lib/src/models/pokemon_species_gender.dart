import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonSpeciesGender extends Model<PokemonSpeciesGenderApiModel> {
  static var adapter = PokemonSpeciesGenderAdapter();

  const PokemonSpeciesGender({required super.service, required super.apiModel});

  /// The chance of this Pokémon being female, in eighths; or -1 for genderless.
  int get rate => apiModel.rate;

  /// A Pokémon species that can be the referenced gender.
  Future<Either<Error, PokemonSpecies>> get pokemonSpecies => PokemonSpecies.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokemonSpecies);
}

class PokemonSpeciesGenderAdapter extends ApiModelAdapter<PokemonSpeciesGenderApiModel, PokemonSpeciesGender> {
  @override
  PokemonSpeciesGender createModelFromApiModel({required IService service, required PokemonSpeciesGenderApiModel apiModel}) {
    return PokemonSpeciesGender(service: service, apiModel: apiModel);
  }
}

class PokemonSpeciesGenderApiResource extends ApiResource {
  const PokemonSpeciesGenderApiResource({required super.url});

  static get mapper => PokemonSpeciesGenderApiResourceMapper();
}

class PokemonSpeciesGenderApiResourceMapper extends ApiResourceMapper<PokemonSpeciesGenderApiResource> {
  @override
  PokemonSpeciesGenderApiResource fromUrl(String url) {
    return PokemonSpeciesGenderApiResource(url: url);
  }
}

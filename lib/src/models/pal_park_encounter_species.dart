import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PalParkEncounterSpecies extends Model<PalParkEncounterSpeciesApiModel> {
  static var adapter = PalParkEncounterSpeciesAdapter();

  const PalParkEncounterSpecies({required super.service, required super.apiModel});

  /// The base score given to the player when this Pokémon is caught during a pal park run.
  int get baseScore => apiModel.baseScore;

  /// The base rate for encountering this Pokémon in this pal park area.
  int get rate => apiModel.rate;

  /// The Pokémon species being encountered.
  Future<Either<Error, PokemonSpecies>> get pokemonSpecies => PokemonSpecies.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokemonSpecies);
}

class PalParkEncounterSpeciesAdapter extends ApiModelAdapter<PalParkEncounterSpeciesApiModel, PalParkEncounterSpecies> {
  @override
  PalParkEncounterSpecies createModelFromApiModel({required IService service, required PalParkEncounterSpeciesApiModel apiModel}) {
    return PalParkEncounterSpecies(service: service, apiModel: apiModel);
  }
}

class PalParkEncounterSpeciesApiResource extends ApiResource {
  const PalParkEncounterSpeciesApiResource({required super.url});

  static get mapper => PalParkEncounterSpeciesApiResourceMapper();
}

class PalParkEncounterSpeciesApiResourceMapper extends ApiResourceMapper<PalParkEncounterSpeciesApiResource> {
  @override
  PalParkEncounterSpeciesApiResource fromUrl(String url) {
    return PalParkEncounterSpeciesApiResource(url: url);
  }
}

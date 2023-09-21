import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonEntry extends Model<PokemonEntryApiModel> {
  static var adapter = PokemonEntryAdapter();

  const PokemonEntry({required super.service, required super.apiModel});

  /// The index of this Pokémon species entry within the Pokédex.
  int get entryNumber => apiModel.entryNumber;

  /// The Pokémon species being encountered.
  Future<Either<Error, PokemonSpecies>> get pokemonSpecies => PokemonSpecies.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokemonSpecies);
}

class PokemonEntryAdapter extends ApiModelAdapter<PokemonEntryApiModel, PokemonEntry> {
  @override
  PokemonEntry createModelFromApiModel({required IService service, required PokemonEntryApiModel apiModel}) {
    return PokemonEntry(service: service, apiModel: apiModel);
  }
}

class PokemonEntryApiResource extends ApiResource {
  const PokemonEntryApiResource({required super.url});

  static get mapper => PokemonEntryApiResourceMapper();
}

class PokemonEntryApiResourceMapper extends ApiResourceMapper<PokemonEntryApiResource> {
  @override
  PokemonEntryApiResource fromUrl(String url) {
    return PokemonEntryApiResource(url: url);
  }
}

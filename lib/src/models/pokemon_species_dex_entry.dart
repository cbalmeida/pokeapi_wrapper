import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonSpeciesDexEntry extends Model<PokemonSpeciesDexEntryApiModel> {
  static var adapter = PokemonSpeciesDexEntryAdapter();

  const PokemonSpeciesDexEntry({required super.service, required super.apiModel});

  /// The index number within the Pokédex.
  int get entryNumber => apiModel.entryNumber;

  /// The Pokédex the referenced Pokémon species can be found in.
  Future<Either<Error, Pokedex>> get pokedex => Pokedex.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokedex);
}

class PokemonSpeciesDexEntryAdapter extends ApiModelAdapter<PokemonSpeciesDexEntryApiModel, PokemonSpeciesDexEntry> {
  @override
  PokemonSpeciesDexEntry createModelFromApiModel({required IService service, required PokemonSpeciesDexEntryApiModel apiModel}) {
    return PokemonSpeciesDexEntry(service: service, apiModel: apiModel);
  }
}

class PokemonSpeciesDexEntryApiResource extends ApiResource {
  const PokemonSpeciesDexEntryApiResource({required super.url});

  static get mapper => PokemonSpeciesDexEntryApiResourceMapper();
}

class PokemonSpeciesDexEntryApiResourceMapper extends ApiResourceMapper<PokemonSpeciesDexEntryApiResource> {
  @override
  PokemonSpeciesDexEntryApiResource fromUrl(String url) {
    return PokemonSpeciesDexEntryApiResource(url: url);
  }
}

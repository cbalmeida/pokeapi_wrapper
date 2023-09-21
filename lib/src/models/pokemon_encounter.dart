import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonEncounter extends Model<PokemonEncounterApiModel> {
  static var adapter = PokemonEncounterAdapter();

  const PokemonEncounter({required super.service, required super.apiModel});

  /// The Pokémon being encountered.
  Future<Either<Error, Pokemon>> get pokemon => Pokemon.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokemon);

  /// A list of versions and encounters with Pokémon that might happen in the referenced location area.
  List<VersionEncounterDetail> get versionDetails => VersionEncounterDetail.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.versionDetails);
}

class PokemonEncounterAdapter extends ApiModelAdapter<PokemonEncounterApiModel, PokemonEncounter> {
  @override
  PokemonEncounter createModelFromApiModel({required IService service, required PokemonEncounterApiModel apiModel}) {
    return PokemonEncounter(service: service, apiModel: apiModel);
  }
}

class PokemonEncounterApiResource extends ApiResource {
  const PokemonEncounterApiResource({required super.url});

  static get mapper => PokemonEncounterApiResourceMapper();
}

class PokemonEncounterApiResourceMapper extends ApiResourceMapper<PokemonEncounterApiResource> {
  @override
  PokemonEncounterApiResource fromUrl(String url) {
    return PokemonEncounterApiResource(url: url);
  }
}

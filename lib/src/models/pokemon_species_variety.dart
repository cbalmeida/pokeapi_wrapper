import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonSpeciesVariety extends Model<PokemonSpeciesVarietyApiModel> {
  static var adapter = PokemonSpeciesVarietyAdapter();

  const PokemonSpeciesVariety({required super.service, required super.apiModel});

  bool get isDefault => apiModel.isDefault;

  Future<Either<Error, Pokemon>> get pokemon => Pokemon.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokemon);
}

class PokemonSpeciesVarietyAdapter extends ApiModelAdapter<PokemonSpeciesVarietyApiModel, PokemonSpeciesVariety> {
  @override
  PokemonSpeciesVariety createModelFromApiModel({required IService service, required PokemonSpeciesVarietyApiModel apiModel}) {
    return PokemonSpeciesVariety(service: service, apiModel: apiModel);
  }
}

class PokemonSpeciesVarietyApiResource extends ApiResource {
  const PokemonSpeciesVarietyApiResource({required super.url});

  static get mapper => PokemonSpeciesVarietyApiResourceMapper();
}

class PokemonSpeciesVarietyApiResourceMapper extends ApiResourceMapper<PokemonSpeciesVarietyApiResource> {
  @override
  PokemonSpeciesVarietyApiResource fromUrl(String url) {
    return PokemonSpeciesVarietyApiResource(url: url);
  }
}

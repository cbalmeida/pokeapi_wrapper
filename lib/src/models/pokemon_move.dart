import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonMove extends Model<PokemonMoveApiModel> {
  static var adapter = PokemonMoveAdapter();

  const PokemonMove({required super.service, required super.apiModel});

  /// The move the Pokémon can learn.
  Future<Either<Error, Move>> get move => Move.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.move);

  /// The details of the version in which the Pokémon can learn the move.
  List<PokemonMoveVersion> get versionGroupDetails => PokemonMoveVersion.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.versionGroupDetails);
}

class PokemonMoveAdapter extends ApiModelAdapter<PokemonMoveApiModel, PokemonMove> {
  @override
  PokemonMove createModelFromApiModel({required IService service, required PokemonMoveApiModel apiModel}) {
    return PokemonMove(service: service, apiModel: apiModel);
  }
}

class PokemonMoveApiResource extends ApiResource {
  const PokemonMoveApiResource({required super.url});

  static get mapper => PokemonMoveApiResourceMapper();
}

class PokemonMoveApiResourceMapper extends ApiResourceMapper<PokemonMoveApiResource> {
  @override
  PokemonMoveApiResource fromUrl(String url) {
    return PokemonMoveApiResource(url: url);
  }
}

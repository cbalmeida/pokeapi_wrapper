import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonType extends Model<PokemonTypeApiModel> {
  static var adapter = PokemonTypeAdapter();

  const PokemonType({required super.service, required super.apiModel});

  /// The order the Pokémon's types are listed in.
  int get slot => apiModel.slot;

  /// The type the referenced Pokémon has.
  Future<Either<Error, Type>> get type => Type.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.type);
}

class PokemonTypeAdapter extends ApiModelAdapter<PokemonTypeApiModel, PokemonType> {
  @override
  PokemonType createModelFromApiModel({required IService service, required PokemonTypeApiModel apiModel}) {
    return PokemonType(service: service, apiModel: apiModel);
  }
}

class PokemonTypeApiResource extends ApiResource {
  const PokemonTypeApiResource({required super.url});

  static get mapper => PokemonTypeApiResourceMapper();
}

class PokemonTypeApiResourceMapper extends ApiResourceMapper<PokemonTypeApiResource> {
  @override
  PokemonTypeApiResource fromUrl(String url) {
    return PokemonTypeApiResource(url: url);
  }
}

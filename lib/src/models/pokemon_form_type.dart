import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonFormType extends Model<PokemonFormTypeApiModel> {
  static var adapter = PokemonFormTypeAdapter();

  const PokemonFormType({required super.service, required super.apiModel});

  /// The order the Pokémon's types are listed in.
  int get slot => apiModel.slot;

  /// The type the referenced Pokémon has.
  Future<Either<Error, Type>> get type => Type.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.type);
}

class PokemonFormTypeAdapter extends ApiModelAdapter<PokemonFormTypeApiModel, PokemonFormType> {
  @override
  PokemonFormType createModelFromApiModel({required IService service, required PokemonFormTypeApiModel apiModel}) {
    return PokemonFormType(service: service, apiModel: apiModel);
  }
}

class PokemonFormTypeApiResource extends ApiResource {
  const PokemonFormTypeApiResource({required super.url});

  static get mapper => PokemonFormTypeApiResourceMapper();
}

class PokemonFormTypeApiResourceMapper extends ApiResourceMapper<PokemonFormTypeApiResource> {
  @override
  PokemonFormTypeApiResource fromUrl(String url) {
    return PokemonFormTypeApiResource(url: url);
  }
}

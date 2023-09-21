import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class TypePokemon extends Model<TypePokemonApiModel> {
  static var adapter = TypePokemonAdapter();

  const TypePokemon({required super.service, required super.apiModel});

  /// The order the Pokémon's types are listed in.
  int get slot => apiModel.slot;

  /// The Pokémon that has the referenced type.
  Future<Either<Error, Pokemon>> get pokemon => Pokemon.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokemon);
}

class TypePokemonAdapter extends ApiModelAdapter<TypePokemonApiModel, TypePokemon> {
  @override
  TypePokemon createModelFromApiModel({required IService service, required TypePokemonApiModel apiModel}) {
    return TypePokemon(service: service, apiModel: apiModel);
  }
}

class TypePokemonApiResource extends ApiResource {
  const TypePokemonApiResource({required super.url});

  static get mapper => TypePokemonApiResourceMapper();
}

class TypePokemonApiResourceMapper extends ApiResourceMapper<TypePokemonApiResource> {
  @override
  TypePokemonApiResource fromUrl(String url) {
    return TypePokemonApiResource(url: url);
  }
}

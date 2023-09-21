import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonTypePast extends Model<PokemonTypePastApiModel> {
  static var adapter = PokemonTypePastAdapter();

  const PokemonTypePast({required super.service, required super.apiModel});

  /// The last generation in which the referenced pokémon had the listed types.
  Future<Either<Error, Generation>> get generation => Generation.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.generation);

  /// The types the referenced pokémon had up to and including the listed generation.
  List<PokemonType> get types => PokemonType.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.types);
}

class PokemonTypePastAdapter extends ApiModelAdapter<PokemonTypePastApiModel, PokemonTypePast> {
  @override
  PokemonTypePast createModelFromApiModel({required IService service, required PokemonTypePastApiModel apiModel}) {
    return PokemonTypePast(service: service, apiModel: apiModel);
  }
}

class PokemonTypePastApiResource extends ApiResource {
  const PokemonTypePastApiResource({required super.url});

  static get mapper => PokemonTypePastApiResourceMapper();
}

class PokemonTypePastApiResourceMapper extends ApiResourceMapper<PokemonTypePastApiResource> {
  @override
  PokemonTypePastApiResource fromUrl(String url) {
    return PokemonTypePastApiResource(url: url);
  }
}

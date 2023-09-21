import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonStat extends Model<PokemonStatApiModel> {
  static var adapter = PokemonStatAdapter();

  const PokemonStat({required super.service, required super.apiModel});

  /// The stat the Pokémon has.
  Future<Either<Error, Stat>> get stat => Stat.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.stat);

  /// The effort points (EV) the Pokémon has in the stat.
  int get effort => apiModel.effort;

  /// The base value of the stat.
  int get baseStat => apiModel.baseStat;
}

class PokemonStatAdapter extends ApiModelAdapter<PokemonStatApiModel, PokemonStat> {
  @override
  PokemonStat createModelFromApiModel({required IService service, required PokemonStatApiModel apiModel}) {
    return PokemonStat(service: service, apiModel: apiModel);
  }
}

class PokemonStatApiResource extends ApiResource {
  const PokemonStatApiResource({required super.url});

  static get mapper => PokemonStatApiResourceMapper();
}

class PokemonStatApiResourceMapper extends ApiResourceMapper<PokemonStatApiResource> {
  @override
  PokemonStatApiResource fromUrl(String url) {
    return PokemonStatApiResource(url: url);
  }
}

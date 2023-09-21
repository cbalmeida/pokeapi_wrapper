import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonHeldItem extends Model<PokemonHeldItemApiModel> {
  static var adapter = PokemonHeldItemAdapter();

  const PokemonHeldItem({required super.service, required super.apiModel});

  /// The item the referenced Pokémon holds.
  Future<Either<Error, Item>> get item => Item.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.item);

  /// The details of the different versions in which the item is held.
  List<PokemonHeldItemVersion> get versionDetails => PokemonHeldItemVersion.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.versionDetails);
}

class PokemonHeldItemAdapter extends ApiModelAdapter<PokemonHeldItemApiModel, PokemonHeldItem> {
  @override
  PokemonHeldItem createModelFromApiModel({required IService service, required PokemonHeldItemApiModel apiModel}) {
    return PokemonHeldItem(service: service, apiModel: apiModel);
  }
}

class PokemonHeldItemApiResource extends ApiResource {
  const PokemonHeldItemApiResource({required super.url});

  static get mapper => PokemonHeldItemApiResourceMapper();
}

class PokemonHeldItemApiResourceMapper extends ApiResourceMapper<PokemonHeldItemApiResource> {
  @override
  PokemonHeldItemApiResource fromUrl(String url) {
    return PokemonHeldItemApiResource(url: url);
  }
}

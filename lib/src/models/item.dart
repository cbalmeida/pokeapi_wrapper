import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Item extends Model<ItemApiModel> {
  static var adapter = ItemAdapter();

  const Item({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name of this resource.
  String get name => apiModel.name;

  /// The price of this item in stores.
  int get cost => apiModel.cost;

  /// The power of the move Fling when used with this item.
  int get flingPower => apiModel.flingPower;

  /// The effect of the move Fling when used with this item.
  Future<Either<Error, ItemFlingEffect>> get flingEffect => ItemFlingEffect.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.flingEffect);

  /// A list of attributes this item has.
  Future<Either<Error, List<ItemAttribute>>> get attributes => ItemAttribute.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.attributes);

  /// The category of items this item falls into.
  Future<Either<Error, ItemCategory>> get category => ItemCategory.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.category);

  /// The effect of this ability listed in different languages.
  List<VerboseEffect> get effectEntries => VerboseEffect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.effectEntries);

  /// The flavor text of this ability listed in different languages.
  List<VersionGroupFlavorText> get flavorTextEntries => VersionGroupFlavorText.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.flavorTextEntries);

  /// A list of game indices relevent to this item by generation.
  List<GenerationGameIndex> get gameIndices => GenerationGameIndex.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.gameIndices);

  /// The name of this item listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A set of sprites used to depict this item in the game.
  ItemSprites get sprites => ItemSprites.adapter.createModelFromApiModel(service: service, apiModel: apiModel.sprites);

  /// A list of Pokémon that might be found in the wild holding this item.
  List<ItemHolderPokemon> get heldByPokemon => ItemHolderPokemon.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.heldByPokemon);

  /// An evolution chain this item requires to produce a bay during mating.
  Future<Either<Error, EvolutionChain>> get babyTriggerFor => EvolutionChain.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.babyTriggerFor);

  /// A list of the machines related to this item.
  List<MachineVersionDetail> get machines => MachineVersionDetail.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.machines);
}

class ItemAdapter extends ApiResourceAdapter<ItemApiModel, Item, ItemApiResource> {
  @override
  Future<Either<Error, ItemApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getItem(apiResource.url);
  }

  @override
  Item createModelFromApiModel({required IService service, required ItemApiModel apiModel}) {
    return Item(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/item';

  @override
  Future<Either<Error, List<ItemApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getItemList(offSet: offSet, limit: limit);
  }
}

class ItemApiResource extends ApiResource {
  const ItemApiResource({required super.url});

  static get mapper => ItemApiResourceMapper();
}

class ItemApiResourceMapper extends ApiResourceMapper<ItemApiResource> {
  @override
  ItemApiResource fromUrl(String url) {
    return ItemApiResource(url: url);
  }
}

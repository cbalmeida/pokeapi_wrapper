import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Pokemon extends Model<PokemonApiModel> {
  static var adapter = PokemonAdapter();

  const Pokemon({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The base experience gained for defeating this Pokémon.
  int get baseExperience => apiModel.baseExperience;

  /// The height of this Pokémon in decimetres.
  int get height => apiModel.height;

  /// Set for exactly one Pokémon used as the default for each species.
  bool get isDefault => apiModel.isDefault;

  /// Order for sorting. Almost national order, except families are grouped together.
  int get order => apiModel.order;

  /// The weight of this Pokémon in hectograms.
  int get weight => apiModel.weight;

  /// A list of abilities this Pokémon could potentially have.
  List<PokemonAbility> get abilities => PokemonAbility.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.abilities);

  /// A list of forms this Pokémon can take on.
  Future<Either<Error, List<PokemonForm>>> get forms => PokemonForm.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.forms);

  /// A list of game indices relevent to Pokémon item by generation.
  List<VersionGameIndex> get gameIndices => VersionGameIndex.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.gameIndices);

  /// A list of items this Pokémon may be holding when encountered.
  List<PokemonHeldItem> get heldItems => PokemonHeldItem.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.heldItems);

  /// A link to a list of location areas, as well as encounter details pertaining to specific versions.
  String get locationAreaEncounters => apiModel.locationAreaEncounters;

  /// A list of moves along with learn methods and level details pertaining to specific version groups.
  List<PokemonMove> get moves => PokemonMove.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.moves);

  /// A list of details showing types this pokémon had in previous generations
  List<PokemonTypePast> get pastTypes => PokemonTypePast.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pastTypes);

  /// A set of sprites used to depict this Pokémon in the game. A visual representation of the various sprites can be found at PokeAPI/sprites
  PokemonSprites get sprites => PokemonSprites.adapter.createModelFromApiModel(service: service, apiModel: apiModel.sprites);

  /// The species this Pokémon belongs to.
  Future<Either<Error, PokemonSpecies>> get species => PokemonSpecies.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.species);

  /// A list of base stat values for this Pokémon.
  List<PokemonStat> get stats => PokemonStat.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.stats);

  /// A list of details showing types this Pokémon has.
  List<PokemonType> get types => PokemonType.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.types);
}

class PokemonAdapter extends ApiResourceAdapter<PokemonApiModel, Pokemon, PokemonApiResource> {
  @override
  Future<Either<Error, PokemonApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getPokemon(apiResource.url);
  }

  @override
  Pokemon createModelFromApiModel({required IService service, required PokemonApiModel apiModel}) {
    return Pokemon(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/pokemon';

  @override
  Future<Either<Error, List<PokemonApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getPokemonList(offSet: offSet, limit: limit);
  }

  PokemonApiResource apiResourceFromId(int id) {
    return PokemonApiResource(url: '$baseUrl/$id/');
  }

  PokemonApiResource apiResourceFromName(String name) {
    return PokemonApiResource(url: '$baseUrl/$name/');
  }

  Future<Either<Error, Pokemon>> fromName({required IService service, required String name}) async {
    return fetchModelFromApiResource(service: service, apiResource: apiResourceFromName(name));
  }
}

class PokemonApiResource extends ApiResource {
  const PokemonApiResource({required super.url});

  static get mapper => PokemonApiResourceMapper();
}

class PokemonApiResourceMapper extends ApiResourceMapper<PokemonApiResource> {
  @override
  PokemonApiResource fromUrl(String url) {
    return PokemonApiResource(url: url);
  }
}

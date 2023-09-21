import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonSpecies extends Model<PokemonSpeciesApiModel> {
  static var adapter = PokemonSpeciesAdapter();

  const PokemonSpecies({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The order in which species should be sorted. Based on National Dex order, except families are grouped together and sorted by stage.
  int get order => apiModel.order;

  /// The chance of this Pokémon being female, in eighths; or -1 for genderless.
  int get genderRate => apiModel.genderRate;

  /// The base capture rate; up to 255. The higher the number, the easier the catch.
  int get captureRate => apiModel.captureRate;

  /// The happiness when caught by a normal Pokéball; up to 255. The higher the number, the happier the Pokémon.
  int get baseHappiness => apiModel.baseHappiness;

  /// Whether or not this is a baby Pokémon.
  bool get isBaby => apiModel.isBaby;

  /// Whether or not this is a legendary Pokémon.
  bool get isLegendary => apiModel.isLegendary;

  /// Whether or not this is a mythical Pokémon.
  bool get isMythical => apiModel.isMythical;

  /// The hatch counter for this Pokémon. The number of steps required to hatch an egg of this species if 0, this Pokémon can't hatch at all.
  int get hatchCounter => apiModel.hatchCounter;

  /// Whether or not this Pokémon has visual gender differences.
  bool get hasGenderDifferences => apiModel.hasGenderDifferences;

  /// Whether or not this Pokémon has multiple forms and can switch between them.
  bool get formsSwitchable => apiModel.formsSwitchable;

  /// The rate at which this Pokémon species gains levels.
  Future<Either<Error, GrowthRate>> get growthRate => GrowthRate.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.growthRate);

  /// A list of Pokedexes and the indexes reserved within them for this Pokémon species.
  List<PokemonSpeciesDexEntry> get pokedexNumbers => PokemonSpeciesDexEntry.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pokedexNumbers);

  /// A list of egg groups this Pokémon species is a member of.
  Future<Either<Error, List<EggGroup>>> get eggGroups => EggGroup.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.eggGroups);

  /// The color of this Pokémon for Pokédex search.
  Future<Either<Error, PokemonColor>> get color => PokemonColor.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.color);

  /// The shape of this Pokémon for Pokédex search.
  Future<Either<Error, PokemonShape>> get shape => PokemonShape.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.shape);

  /// The Pokémon species that evolves into this Pokemon_species.
  Future<Either<Error, PokemonSpecies>> get evolvesFromSpecies => PokemonSpecies.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.evolvesFromSpecies);

  /// The evolution chain this Pokémon species is a member of.
  Future<Either<Error, EvolutionChain>> get evolutionChain => EvolutionChain.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.evolutionChain);

  /// The habitat this Pokémon species can be encountered in.
  Future<Either<Error, PokemonHabitat>> get habitat => PokemonHabitat.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.habitat);

  /// The generation this Pokémon species was introduced in.
  Future<Either<Error, Generation>> get generation => Generation.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.generation);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of encounters that can be had with this Pokémon species in pal park.
  List<PalParkEncounterArea> get palParkEncounters => PalParkEncounterArea.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.palParkEncounters);

  /// A list of flavor text entries for this Pokémon species.
  List<FlavorText> get flavorTextEntries => FlavorText.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.flavorTextEntries);

  /// Descriptions of different forms Pokémon take on within the Pokémon species.
  List<Description> get formDescriptions => Description.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.formDescriptions);

  /// The genus of this Pokémon species listed in multiple languages.
  List<Genus> get genera => Genus.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.genera);

  /// A list of the Pokémon that exist within this Pokémon species.
  List<PokemonSpeciesVariety> get varieties => PokemonSpeciesVariety.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.varieties);
}

class PokemonSpeciesAdapter extends ApiResourceAdapter<PokemonSpeciesApiModel, PokemonSpecies, PokemonSpeciesApiResource> {
  @override
  Future<Either<Error, PokemonSpeciesApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getPokemonSpecies(apiResource.url);
  }

  @override
  PokemonSpecies createModelFromApiModel({required IService service, required PokemonSpeciesApiModel apiModel}) {
    return PokemonSpecies(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/pokemon-species';

  @override
  Future<Either<Error, List<PokemonSpeciesApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getPokemonSpeciesList(offSet: offSet, limit: limit);
  }
}

class PokemonSpeciesApiResource extends ApiResource {
  const PokemonSpeciesApiResource({required super.url});

  static get mapper => PokemonSpeciesApiResourceMapper();
}

class PokemonSpeciesApiResourceMapper extends ApiResourceMapper<PokemonSpeciesApiResource> {
  @override
  PokemonSpeciesApiResource fromUrl(String url) {
    return PokemonSpeciesApiResource(url: url);
  }
}

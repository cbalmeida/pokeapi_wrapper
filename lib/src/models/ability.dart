import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Ability extends Model<AbilityApiModel> {
  static var adapter = AbilityAdapter();

  const Ability({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// Whether or not this ability originated in the main series of the video games.
  bool get isMainSeries => apiModel.isMainSeries;

  /// The generation this ability originated in.
  Future<Either<Error, Generation>> get generation => Generation.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.generation);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// The effect of this ability listed in different languages.
  List<VerboseEffect> get effectEntries => VerboseEffect.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.effectEntries);

  /// The list of previous effects this ability has had across version groups.
  List<AbilityEffectChange> get effectChanges => AbilityEffectChange.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.effectChanges);

  /// The flavor text of this ability listed in different languages.
  List<AbilityFlavorText> get flavorTextEntries => AbilityFlavorText.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.flavorTextEntries);

  /// A list of Pokémon that could potentially have this ability.
  List<AbilityPokemon> get pokemon => AbilityPokemon.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pokemon);
}

class AbilityAdapter extends ApiResourceAdapter<AbilityApiModel, Ability, AbilityApiResource> {
  @override
  Future<Either<Error, AbilityApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getAbility(apiResource.url);
  }

  @override
  Ability createModelFromApiModel({required IService service, required AbilityApiModel apiModel}) {
    return Ability(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/ability';

  @override
  Future<Either<Error, List<AbilityApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getAbilityList(offSet: offSet, limit: limit);
  }
}

class AbilityApiResource extends ApiResource {
  const AbilityApiResource({required super.url});

  static get mapper => AbilityApiResourceMapper();
}

class AbilityApiResourceMapper extends ApiResourceMapper<AbilityApiResource> {
  @override
  AbilityApiResource fromUrl(String url) {
    return AbilityApiResource(url: url);
  }
}

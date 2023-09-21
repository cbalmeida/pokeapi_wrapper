import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonForm extends Model<PokemonFormApiModel> {
  static var adapter = PokemonFormAdapter();

  const PokemonForm({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The order in which forms should be sorted within all forms. Multiple forms may have equal order, in which case they should fall back on sorting by name.
  int get order => apiModel.order;

  /// The order in which forms should be sorted within a species' forms.
  int get formOrder => apiModel.formOrder;

  /// True for exactly one form used as the default for each Pokémon.
  bool get isDefault => apiModel.isDefault;

  /// Whether or not this form can only happen during battle.
  bool get isBattleOnly => apiModel.isBattleOnly;

  /// Whether or not this form requires mega evolution.
  bool get isMega => apiModel.isMega;

  /// The name of this form.
  String get formName => apiModel.formName;

  /// The Pokémon that can take on this form.
  Future<Either<Error, Pokemon>> get pokemon => Pokemon.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.pokemon);

  /// A list of details showing types this Pokémon form has.
  List<PokemonFormType> get types => PokemonFormType.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.types);

  /// A set of sprites used to depict this Pokémon form in the game.
  PokemonFormSprites get sprites => PokemonFormSprites.adapter.createModelFromApiModel(service: service, apiModel: apiModel.sprites);

  /// The version group this Pokémon form was introduced in.
  Future<Either<Error, VersionGroup>> get versionGroup => VersionGroup.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.versionGroup);

  /// The form specific full name of this Pokémon form, or empty if the form does not have a specific name.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// The form specific form name of this Pokémon form, or empty if the form does not have a specific name.
  List<Name> get formNames => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.formNames);
}

class PokemonFormAdapter extends ApiResourceAdapter<PokemonFormApiModel, PokemonForm, PokemonFormApiResource> {
  @override
  Future<Either<Error, PokemonFormApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getPokemonForm(apiResource.url);
  }

  @override
  PokemonForm createModelFromApiModel({required IService service, required PokemonFormApiModel apiModel}) {
    return PokemonForm(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/pokemon-form';

  @override
  Future<Either<Error, List<PokemonFormApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getPokemonFormList(offSet: offSet, limit: limit);
  }
}

class PokemonFormApiResource extends ApiResource {
  const PokemonFormApiResource({required super.url});

  static get mapper => PokemonFormApiResourceMapper();
}

class PokemonFormApiResourceMapper extends ApiResourceMapper<PokemonFormApiResource> {
  @override
  PokemonFormApiResource fromUrl(String url) {
    return PokemonFormApiResource(url: url);
  }
}

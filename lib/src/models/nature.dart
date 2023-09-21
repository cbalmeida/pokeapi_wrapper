import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Nature extends Model<NatureApiModel> {
  static var adapter = NatureAdapter();

  const Nature({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The stat decreased by 10% in Pokémon with this nature.
  Future<Either<Error, Stat>> get decreasedStat => Stat.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.decreasedStat);

  /// The stat increased by 10% in Pokémon with this nature.
  Future<Either<Error, Stat>> get increasedStat => Stat.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.increasedStat);

  /// The flavor hated by Pokémon with this nature.
  Future<Either<Error, BerryFlavor>> get hatesFlavor => BerryFlavor.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.hatesFlavor);

  /// The flavor liked by Pokémon with this nature.
  Future<Either<Error, BerryFlavor>> get likesFlavor => BerryFlavor.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.likesFlavor);

  /// A list of Pokéathlon stats this nature effects and how much it effects them.
  List<NatureStatChange> get pokeathlonStatChanges => NatureStatChange.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pokeathlonStatChanges);

  /// A list of battle styles and how likely a Pokémon with this nature is to use them in the Battle Palace or Battle Tent.
  List<MoveBattleStylePreference> get moveBattleStylePreferences => MoveBattleStylePreference.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.moveBattleStylePreferences);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class NatureAdapter extends ApiResourceAdapter<NatureApiModel, Nature, NatureApiResource> {
  @override
  Future<Either<Error, NatureApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getNature(apiResource.url);
  }

  @override
  Nature createModelFromApiModel({required IService service, required NatureApiModel apiModel}) {
    return Nature(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/nature';

  @override
  Future<Either<Error, List<NatureApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getNatureList(offSet: offSet, limit: limit);
  }
}

class NatureApiResource extends ApiResource {
  const NatureApiResource({required super.url});

  static get mapper => NatureApiResourceMapper();
}

class NatureApiResourceMapper extends ApiResourceMapper<NatureApiResource> {
  @override
  NatureApiResource fromUrl(String url) {
    return NatureApiResource(url: url);
  }
}

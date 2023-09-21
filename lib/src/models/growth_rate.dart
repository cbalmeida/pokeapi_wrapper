import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class GrowthRate extends Model<GrowthRateApiModel> {
  static var adapter = GrowthRateAdapter();

  const GrowthRate({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The formula used to calculate the rate at which the Pokémon species gains level.
  String get formula => apiModel.formula;

  /// The descriptions of this characteristic listed in different languages.
  List<Description> get descriptions => Description.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.descriptions);

  /// A list of levels and the amount of experienced needed to atain them based on this growth rate.
  List<GrowthRateExperienceLevel> get levels => GrowthRateExperienceLevel.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.levels);

  /// A list of Pokémon species that gain levels at this growth rate.
  Future<Either<Error, List<PokemonSpecies>>> get pokemonSpecies => PokemonSpecies.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.pokemonSpecies);
}

class GrowthRateAdapter extends ApiResourceAdapter<GrowthRateApiModel, GrowthRate, GrowthRateApiResource> {
  @override
  Future<Either<Error, GrowthRateApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getGrowthRate(apiResource.url);
  }

  @override
  GrowthRate createModelFromApiModel({required IService service, required GrowthRateApiModel apiModel}) {
    return GrowthRate(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/growth-rate';

  @override
  Future<Either<Error, List<GrowthRateApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getGrowthRateList(offSet: offSet, limit: limit);
  }
}

class GrowthRateApiResource extends ApiResource {
  const GrowthRateApiResource({required super.url});

  static get mapper => GrowthRateApiResourceMapper();
}

class GrowthRateApiResourceMapper extends ApiResourceMapper<GrowthRateApiResource> {
  @override
  GrowthRateApiResource fromUrl(String url) {
    return GrowthRateApiResource(url: url);
  }
}

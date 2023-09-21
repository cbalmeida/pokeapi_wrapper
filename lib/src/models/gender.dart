import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Gender extends Model<GenderApiModel> {
  static var adapter = GenderAdapter();

  const Gender({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// A list of Pokémon species that can be this gender and how likely it is that they will be.
  List<PokemonSpeciesGender> get pokemonSpeciesDetails => PokemonSpeciesGender.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pokemonSpeciesDetails);

  /// A list of Pokémon species that required this gender in order for a Pokémon to evolve into them.
  Future<Either<Error, List<PokemonSpecies>>> get requiredForEvolution => PokemonSpecies.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.requiredForEvolution);
}

class GenderAdapter extends ApiResourceAdapter<GenderApiModel, Gender, GenderApiResource> {
  @override
  Future<Either<Error, GenderApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getGender(apiResource.url);
  }

  @override
  Gender createModelFromApiModel({required IService service, required GenderApiModel apiModel}) {
    return Gender(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/gender';

  @override
  Future<Either<Error, List<GenderApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getGenderList(offSet: offSet, limit: limit);
  }
}

class GenderApiResource extends ApiResource {
  const GenderApiResource({required super.url});

  static get mapper => GenderApiResourceMapper();
}

class GenderApiResourceMapper extends ApiResourceMapper<GenderApiResource> {
  @override
  GenderApiResource fromUrl(String url) {
    return GenderApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Characteristic extends Model<CharacteristicApiModel> {
  static var adapter = CharacteristicAdapter();

  const Characteristic({required super.service, required super.apiModel});

  /// The id for this characteristic resource
  int get id => apiModel.id;

  /// The remainder of the highest stat/IV divided by 5
  int get geneModulo => apiModel.geneModulo;

  /// The possible values of the highest stat that would result in a Pokémon recieving this characteristic when divided by 5
  List<int> get possibleValues => apiModel.possibleValues;

  /// The stat which results in this characteristic
  Future<Either<Error, Stat>> get highestStat => Stat.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.highestStat);

  /// The descriptions of this characteristic listed in different languages
  List<Description> get descriptions => Description.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.descriptions);
}

class CharacteristicAdapter extends ApiResourceAdapter<CharacteristicApiModel, Characteristic, CharacteristicApiResource> {
  @override
  Future<Either<Error, CharacteristicApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getCharacteristic(apiResource.url);
  }

  @override
  Characteristic createModelFromApiModel({required IService service, required CharacteristicApiModel apiModel}) {
    return Characteristic(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/characteristic';

  @override
  Future<Either<Error, List<CharacteristicApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getCharacteristicList(offSet: offSet, limit: limit);
  }
}

class CharacteristicApiResource extends ApiResource {
  const CharacteristicApiResource({required super.url});

  static get mapper => CharacteristicApiResourceMapper();
}

class CharacteristicApiResourceMapper extends ApiResourceMapper<CharacteristicApiResource> {
  @override
  CharacteristicApiResource fromUrl(String url) {
    return CharacteristicApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Type extends Model<TypeApiModel> {
  static var adapter = TypeAdapter();

  const Type({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// A detail of how effective this type is toward others and vice versa.
  TypeRelations get damageRelations => TypeRelations.adapter.createModelFromApiModel(service: service, apiModel: apiModel.damageRelations);

  /// A list of details of how effective this type was toward others and vice versa in previous generations
  List<TypeRelationsPast> get pastDamageRelations => TypeRelationsPast.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pastDamageRelations);

  /// A list of game indices relevent to this item by generation.
  List<GenerationGameIndex> get gameIndices => GenerationGameIndex.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.gameIndices);

  /// The generation this type was introduced in.
  Future<Either<Error, Generation>> get generation => Generation.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.generation);

  /// The class of damage inflicted by this type.
  Future<Either<Error, MoveDamageClass>> get moveDamageClass => MoveDamageClass.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.moveDamageClass);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of details of Pokémon that have this type.
  List<TypePokemon> get pokemon => TypePokemon.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.pokemon);

  /// A list of moves that have this type.
  Future<Either<Error, List<Move>>> get moves => Move.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.moves);
}

class TypeAdapter extends ApiResourceAdapter<TypeApiModel, Type, TypeApiResource> {
  @override
  Future<Either<Error, TypeApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getType(apiResource.url);
  }

  @override
  Type createModelFromApiModel({required IService service, required TypeApiModel apiModel}) {
    return Type(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/type';

  @override
  Future<Either<Error, List<TypeApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getTypeList(offSet: offSet, limit: limit);
  }
}

class TypeApiResource extends ApiResource {
  const TypeApiResource({required super.url});

  static get mapper => TypeApiResourceMapper();
}

class TypeApiResourceMapper extends ApiResourceMapper<TypeApiResource> {
  @override
  TypeApiResource fromUrl(String url) {
    return TypeApiResource(url: url);
  }
}

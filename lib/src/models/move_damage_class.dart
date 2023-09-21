import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveDamageClass extends Model<MoveDamageClassApiModel> {
  static var adapter = MoveDamageClassAdapter();

  const MoveDamageClass({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// The description of this resource listed in different languages.
  List<Description> get descriptions => Description.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.descriptions);

  /// A list of moves that have this damage class.
  Future<Either<Error, List<Move>>> get moves => Move.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.moves);

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class MoveDamageClassAdapter extends ApiResourceAdapter<MoveDamageClassApiModel, MoveDamageClass, MoveDamageClassApiResource> {
  @override
  Future<Either<Error, MoveDamageClassApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getMoveDamageClass(apiResource.url);
  }

  @override
  MoveDamageClass createModelFromApiModel({required IService service, required MoveDamageClassApiModel apiModel}) {
    return MoveDamageClass(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/move-damage-class';

  @override
  Future<Either<Error, List<MoveDamageClassApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getMoveDamageClassList(offSet: offSet, limit: limit);
  }
}

class MoveDamageClassApiResource extends ApiResource {
  const MoveDamageClassApiResource({required super.url});

  static get mapper => MoveDamageClassApiResourceMapper();
}

class MoveDamageClassApiResourceMapper extends ApiResourceMapper<MoveDamageClassApiResource> {
  @override
  MoveDamageClassApiResource fromUrl(String url) {
    return MoveDamageClassApiResource(url: url);
  }
}

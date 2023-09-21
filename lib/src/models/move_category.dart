import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class MoveCategory extends Model<MoveCategoryApiModel> {
  static var adapter = MoveCategoryAdapter();

  const MoveCategory({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// A list of moves that fall into this category.
  Future<Either<Error, List<Move>>> get moves => Move.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.moves);

  /// The description of this resource listed in different languages.
  List<Description> get descriptions => Description.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.descriptions);
}

class MoveCategoryAdapter extends ApiResourceAdapter<MoveCategoryApiModel, MoveCategory, MoveCategoryApiResource> {
  @override
  Future<Either<Error, MoveCategoryApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getMoveCategory(apiResource.url);
  }

  @override
  MoveCategory createModelFromApiModel({required IService service, required MoveCategoryApiModel apiModel}) {
    return MoveCategory(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/move-category';

  @override
  Future<Either<Error, List<MoveCategoryApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getMoveCategoryList(offSet: offSet, limit: limit);
  }
}

class MoveCategoryApiResource extends ApiResource {
  const MoveCategoryApiResource({required super.url});

  static get mapper => MoveCategoryApiResourceMapper();
}

class MoveCategoryApiResourceMapper extends ApiResourceMapper<MoveCategoryApiResource> {
  @override
  MoveCategoryApiResource fromUrl(String url) {
    return MoveCategoryApiResource(url: url);
  }
}

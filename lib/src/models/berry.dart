import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Berry extends Model<BerryApiModel> {
  static var adapter = BerryAdapter();

  const Berry({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// Time it takes the tree to grow one stage, in hours. Berry trees go through four of these growth stages before they can be picked.
  int get growthTime => apiModel.growthTime;

  /// The maximum number of these berries that can grow on one tree in Generation IV.
  int get maxHarvest => apiModel.maxHarvest;

  /// The power of the move "Natural Gift" when used with this Berry.
  int get naturalGiftPower => apiModel.naturalGiftPower;

  /// The size of this Berry, in millimeters.
  int get size => apiModel.size;

  /// The smoothness of this Berry, used in making Pokéblocks or Poffins.
  int get smoothness => apiModel.smoothness;

  /// The speed at which this Berry dries out the soil as it grows. A higher rate means the soil dries more quickly.
  int get soilDryness => apiModel.soilDryness;

  /// The firmness of this berry, used in making Pokéblocks or Poffins.
  Future<Either<Error, BerryFirmness>> get firmness => BerryFirmness.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.firmness);

  /// A list of references to each flavor a berry can have and the potency of each of those flavors in regard to this berry.
  List<BerryFlavorMap> get flavors => BerryFlavorMap.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.flavors);

  /// Berries are actually items. This is a reference to the item specific data for this berry.
  Future<Either<Error, Item>> get item => Item.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.item);

  /// The Type the move "Natural Gift" has when used with this Berry.
  Future<Either<Error, Type>> get naturalGiftType => Type.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.naturalGiftType);
}

class BerryAdapter extends ApiResourceAdapter<BerryApiModel, Berry, BerryApiResource> {
  @override
  Future<Either<Error, BerryApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getBerry(apiResource.url);
  }

  @override
  Berry createModelFromApiModel({required IService service, required BerryApiModel apiModel}) {
    return Berry(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/berry';

  @override
  Future<Either<Error, List<BerryApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getBerryList(offSet: offSet, limit: limit);
  }
}

class BerryApiResource extends ApiResource {
  const BerryApiResource({required super.url});

  static get mapper => BerryApiResourceMapper();
}

class BerryApiResourceMapper extends ApiResourceMapper<BerryApiResource> {
  @override
  BerryApiResource fromUrl(String url) {
    return BerryApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ContestComboDetail extends Model<ContestComboDetailApiModel> {
  static var adapter = ContestComboDetailAdapter();

  const ContestComboDetail({required super.service, required super.apiModel});

  /// A list of moves to use before this move.
  Future<Either<Error, List<Move>>> get useBefore => Move.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.useBefore);

  /// A list of moves to use after this move.
  Future<Either<Error, List<Move>>> get useAfter => Move.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.useAfter);
}

class ContestComboDetailAdapter extends ApiModelAdapter<ContestComboDetailApiModel, ContestComboDetail> {
  @override
  ContestComboDetail createModelFromApiModel({required IService service, required ContestComboDetailApiModel apiModel}) {
    return ContestComboDetail(service: service, apiModel: apiModel);
  }
}

class ContestComboDetailApiResource extends ApiResource {
  const ContestComboDetailApiResource({required super.url});

  static get mapper => ContestComboDetailApiResourceMapper();
}

class ContestComboDetailApiResourceMapper extends ApiResourceMapper<ContestComboDetailApiResource> {
  @override
  ContestComboDetailApiResource fromUrl(String url) {
    return ContestComboDetailApiResource(url: url);
  }
}

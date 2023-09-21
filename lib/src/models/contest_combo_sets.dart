import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ContestComboSets extends Model<ContestComboSetsApiModel> {
  static var adapter = ContestComboSetsAdapter();

  const ContestComboSets({required super.service, required super.apiModel});

  /// A detail of moves this move can be used before or after, granting additional appeal points in contests.
  ContestComboDetail get normalValue => ContestComboDetail.adapter.createModelFromApiModel(service: service, apiModel: apiModel.normalValue);

  /// A detail of moves this move can be used before or after, granting additional appeal points in super contests.
  ContestComboDetail get superValue => ContestComboDetail.adapter.createModelFromApiModel(service: service, apiModel: apiModel.superValue);
}

class ContestComboSetsAdapter extends ApiModelAdapter<ContestComboSetsApiModel, ContestComboSets> {
  @override
  ContestComboSets createModelFromApiModel({required IService service, required ContestComboSetsApiModel apiModel}) {
    return ContestComboSets(service: service, apiModel: apiModel);
  }
}

class ContestComboSetsApiResource extends ApiResource {
  const ContestComboSetsApiResource({required super.url});

  static get mapper => ContestComboSetsApiResourceMapper();
}

class ContestComboSetsApiResourceMapper extends ApiResourceMapper<ContestComboSetsApiResource> {
  @override
  ContestComboSetsApiResource fromUrl(String url) {
    return ContestComboSetsApiResource(url: url);
  }
}

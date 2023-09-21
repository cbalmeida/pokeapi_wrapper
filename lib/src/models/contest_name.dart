import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class ContestName extends Model<ContestNameApiModel> {
  static var adapter = ContestNameAdapter();

  const ContestName({required super.service, required super.apiModel});

  /// The name for this contest.
  String get name => apiModel.name;

  /// The color associated with this contest's name.
  String get color => apiModel.color;

  /// The language that this name is in.s
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);
}

class ContestNameAdapter extends ApiModelAdapter<ContestNameApiModel, ContestName> {
  @override
  ContestName createModelFromApiModel({required IService service, required ContestNameApiModel apiModel}) {
    return ContestName(service: service, apiModel: apiModel);
  }
}

class ContestNameApiResource extends ApiResource {
  const ContestNameApiResource({required super.url});

  static get mapper => ContestNameApiResourceMapper();
}

class ContestNameApiResourceMapper extends ApiResourceMapper<ContestNameApiResource> {
  @override
  ContestNameApiResource fromUrl(String url) {
    return ContestNameApiResource(url: url);
  }
}

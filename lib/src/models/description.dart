import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Description extends Model<DescriptionApiModel> {
  static var adapter = DescriptionAdapter();

  const Description({required super.service, required super.apiModel});

  /// The localized description for an API resource in a specific language.
  String get description => apiModel.description;

  /// The language this name is in.
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);
}

class DescriptionAdapter extends ApiModelAdapter<DescriptionApiModel, Description> {
  @override
  Description createModelFromApiModel({required IService service, required DescriptionApiModel apiModel}) {
    return Description(service: service, apiModel: apiModel);
  }
}

class DescriptionApiResource extends ApiResource {
  const DescriptionApiResource({required super.url});

  static get mapper => DescriptionApiResourceMapper();
}

class DescriptionApiResourceMapper extends ApiResourceMapper<DescriptionApiResource> {
  @override
  DescriptionApiResource fromUrl(String url) {
    return DescriptionApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class AwesomeName extends Model<AwesomeNameApiModel> {
  static var adapter = AwesomeNameAdapter();

  const AwesomeName({required super.service, required super.apiModel});

  /// The localized "official" name for an API resource in a specific language.
  String get awesomeName => apiModel.awesomeName;

  /// The language this "official" name is in.
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);
}

class AwesomeNameAdapter extends ApiModelAdapter<AwesomeNameApiModel, AwesomeName> {
  @override
  AwesomeName createModelFromApiModel({required IService service, required AwesomeNameApiModel apiModel}) {
    return AwesomeName(service: service, apiModel: apiModel);
  }
}

class AwesomeNameApiResource extends ApiResource {
  const AwesomeNameApiResource({required super.url});

  static get mapper => AwesomeNameApiResourceMapper();
}

class AwesomeNameApiResourceMapper extends ApiResourceMapper<AwesomeNameApiResource> {
  @override
  AwesomeNameApiResource fromUrl(String url) {
    return AwesomeNameApiResource(url: url);
  }
}

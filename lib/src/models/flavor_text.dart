import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class FlavorText extends Model<FlavorTextApiModel> {
  static var adapter = FlavorTextAdapter();

  const FlavorText({required super.service, required super.apiModel});

  /// The localized flavor text for an API resource in a specific language. Note that this text is left unprocessed as it is found in game files. This means that it contains special characters that one might want to replace with their visible decodable version. Please check out to find out more at: https://github.com/veekun/pokedex/issues/218#issuecomment-339841781.
  String get flavorText => apiModel.flavorText;

  /// The language this name is in.
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);

  /// The game version this flavor text is extracted from.
  Future<Either<Error, Version>> get version => Version.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.version);
}

class FlavorTextAdapter extends ApiModelAdapter<FlavorTextApiModel, FlavorText> {
  @override
  FlavorText createModelFromApiModel({required IService service, required FlavorTextApiModel apiModel}) {
    return FlavorText(service: service, apiModel: apiModel);
  }
}

class FlavorTextApiResource extends ApiResource {
  const FlavorTextApiResource({required super.url});

  static get mapper => FlavorTextApiResourceMapper();
}

class FlavorTextApiResourceMapper extends ApiResourceMapper<FlavorTextApiResource> {
  @override
  FlavorTextApiResource fromUrl(String url) {
    return FlavorTextApiResource(url: url);
  }
}

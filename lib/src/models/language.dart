import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Language extends Model<LanguageApiModel> {
  static var adapter = LanguageAdapter();

  const Language({required super.service, required super.apiModel});

  /// The identifier for this resource.
  int get id => apiModel.id;

  /// The name for this resource.
  String get name => apiModel.name;

  /// Whether or not the games are published in this language.
  bool get official => apiModel.official;

  /// The two-letter code of the country where this language is spoken. Note that it is not unique.
  String get iso639 => apiModel.iso639;

  /// The two-letter code of the language. Note that it is not unique.
  String get iso3166 => apiModel.iso3166;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);
}

class LanguageAdapter extends ApiResourceAdapter<LanguageApiModel, Language, LanguageApiResource> {
  @override
  Future<Either<Error, LanguageApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) {
    return service.getLanguage(apiResource.url);
  }

  @override
  Language createModelFromApiModel({required IService service, required LanguageApiModel apiModel}) {
    return Language(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/language';

  @override
  Future<Either<Error, List<LanguageApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getLanguageList(offSet: offSet, limit: limit);
  }
}

class LanguageApiResource extends ApiResource {
  const LanguageApiResource({required super.url});

  static get mapper => LanguageApiResourceMapper();
}

class LanguageApiResourceMapper extends ApiResourceMapper<LanguageApiResource> {
  @override
  LanguageApiResource fromUrl(String url) {
    return LanguageApiResource(url: url);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Genus extends Model<GenusApiModel> {
  static var adapter = GenusAdapter();

  const Genus({required super.service, required super.apiModel});

  /// The localized genus for the referenced Pokémon species
  String get genus => apiModel.genus;

  /// The language this genus is in.
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);
}

class GenusAdapter extends ApiModelAdapter<GenusApiModel, Genus> {
  @override
  Genus createModelFromApiModel({required IService service, required GenusApiModel apiModel}) {
    return Genus(service: service, apiModel: apiModel);
  }
}

class GenusApiResource extends ApiResource {
  const GenusApiResource({required super.url});

  static get mapper => GenusApiResourceMapper();
}

class GenusApiResourceMapper extends ApiResourceMapper<GenusApiResource> {
  @override
  GenusApiResource fromUrl(String url) {
    return GenusApiResource(url: url);
  }
}

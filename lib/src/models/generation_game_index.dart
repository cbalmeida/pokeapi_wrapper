import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class GenerationGameIndex extends Model<GenerationGameIndexApiModel> {
  static var adapter = GenerationGameIndexAdapter();

  const GenerationGameIndex({required super.service, required super.apiModel});

  /// The internal id of an API resource within game data.
  int get gameIndex => apiModel.gameIndex;

  /// The generation relevant to this game index.
  Future<Either<Error, Generation>> get generation => Generation.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.generation);
}

class GenerationGameIndexAdapter extends ApiModelAdapter<GenerationGameIndexApiModel, GenerationGameIndex> {
  @override
  GenerationGameIndex createModelFromApiModel({required IService service, required GenerationGameIndexApiModel apiModel}) {
    return GenerationGameIndex(service: service, apiModel: apiModel);
  }
}

class GenerationGameIndexApiResource extends ApiResource {
  const GenerationGameIndexApiResource({required super.url});

  static get mapper => GenerationGameIndexApiResourceMapper();
}

class GenerationGameIndexApiResourceMapper extends ApiResourceMapper<GenerationGameIndexApiResource> {
  @override
  GenerationGameIndexApiResource fromUrl(String url) {
    return GenerationGameIndexApiResource(url: url);
  }
}

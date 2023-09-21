import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class Name extends Model<NameApiModel> {
  static var adapter = NameAdapter();

  const Name({required super.service, required super.apiModel});

  /// The localized name for an API resource in a specific language.
  String get name => apiModel.name;

  /// The language this name is in.
  Future<Either<Error, Language>> get language => Language.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.language);
}

class NameAdapter extends ApiModelAdapter<NameApiModel, Name> {
  @override
  Name createModelFromApiModel({required IService service, required NameApiModel apiModel}) {
    return Name(service: service, apiModel: apiModel);
  }
}

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class TypeRelationsPast extends Model<TypeRelationsPastApiModel> {
  static var adapter = TypeRelationsPastAdapter();

  const TypeRelationsPast({required super.service, required super.apiModel});

  /// The previous damage relation of the referenced type with another type.
  Future<Either<Error, Generation>> get generation => Generation.adapter.fetchModelFromApiResource(service: service, apiResource: apiModel.generation);

  /// The damage relationship of the referenced type with past types.
  TypeRelations get damageRelations => TypeRelations.adapter.createModelFromApiModel(service: service, apiModel: apiModel.damageRelations);
}

class TypeRelationsPastAdapter extends ApiModelAdapter<TypeRelationsPastApiModel, TypeRelationsPast> {
  @override
  TypeRelationsPast createModelFromApiModel({required IService service, required TypeRelationsPastApiModel apiModel}) {
    return TypeRelationsPast(service: service, apiModel: apiModel);
  }
}

class TypeRelationsPastApiResource extends ApiResource {
  const TypeRelationsPastApiResource({required super.url});

  static get mapper => TypeRelationsPastApiResourceMapper();
}

class TypeRelationsPastApiResourceMapper extends ApiResourceMapper<TypeRelationsPastApiResource> {
  @override
  TypeRelationsPastApiResource fromUrl(String url) {
    return TypeRelationsPastApiResource(url: url);
  }
}

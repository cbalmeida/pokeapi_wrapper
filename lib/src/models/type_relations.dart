import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class TypeRelations extends Model<TypeRelationsApiModel> {
  static var adapter = TypeRelationsAdapter();

  const TypeRelations({required super.service, required super.apiModel});

  Future<Either<Error, List<Type>>> get noDamageTo => Type.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.noDamageTo);

  Future<Either<Error, List<Type>>> get halfDamageTo => Type.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.halfDamageTo);

  Future<Either<Error, List<Type>>> get doubleDamageTo => Type.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.doubleDamageTo);

  Future<Either<Error, List<Type>>> get noDamageFrom => Type.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.noDamageFrom);

  Future<Either<Error, List<Type>>> get halfDamageFrom => Type.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.halfDamageFrom);

  Future<Either<Error, List<Type>>> get doubleDamageFrom => Type.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.doubleDamageFrom);
}

class TypeRelationsAdapter extends ApiModelAdapter<TypeRelationsApiModel, TypeRelations> {
  @override
  TypeRelations createModelFromApiModel({required IService service, required TypeRelationsApiModel apiModel}) {
    return TypeRelations(service: service, apiModel: apiModel);
  }
}

class TypeRelationsApiResource extends ApiResource {
  const TypeRelationsApiResource({required super.url});

  static get mapper => TypeRelationsApiResourceMapper();
}

class TypeRelationsApiResourceMapper extends ApiResourceMapper<TypeRelationsApiResource> {
  @override
  TypeRelationsApiResource fromUrl(String url) {
    return TypeRelationsApiResource(url: url);
  }
}

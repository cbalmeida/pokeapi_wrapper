import 'package:flutter/cupertino.dart';

import '../core.dart';
import '../services.dart';

@immutable
abstract class Model<T> {
  @protected
  final IService service;

  @protected
  final T apiModel;

  const Model({
    required this.service,
    required this.apiModel,
  });
}

@immutable
abstract class ApiModelAdapter<T, M extends Model<T>> {
  const ApiModelAdapter();

  M createModelFromApiModel({required IService service, required T apiModel});

  List<M> createModelListFromApiModelList({required IService service, required List<T> apiModelList}) {
    List<M> values = [];
    for (var apiModel in apiModelList) {
      M result = createModelFromApiModel(service: service, apiModel: apiModel);
      values.add(result);
    }
    return values;
  }
}

@immutable
abstract class ApiResourceAdapter<T, M extends Model<T>, A extends ApiResource> extends ApiModelAdapter<T, M> {
  const ApiResourceAdapter();

  Future<Either<Error, T>> fetchApiModel({required IService service, required ApiResource apiResource});

  String get baseUrl;

  Future<Either<Error, List<A>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000});

  Future<Either<Error, M>> fetchModelFromApiResource({required IService service, required A apiResource}) async {
    final Either<Error, T> result = await fetchApiModel(service: service, apiResource: apiResource);
    return result.fold(
      (l) => Left(l),
      (r) => Right(createModelFromApiModel(service: service, apiModel: r)),
    );
  }

  Future<Either<Error, List<M>>> fetchModelListFromApiResourceList({required IService service, required List<A> apiResourceList}) async {
    List<M> values = [];
    for (var apiResource in apiResourceList) {
      Either<Error, M> result = await fetchModelFromApiResource(service: service, apiResource: apiResource);
      if (result.isLeft) return Left(result.fold((l) => l, (r) => UnimplementedError()));
      values.add(result.fold((l) => throw l, (r) => r));
    }
    return Right(values);
  }
}

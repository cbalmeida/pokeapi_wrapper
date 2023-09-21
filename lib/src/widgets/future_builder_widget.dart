import 'package:flutter/material.dart';

import '../../pokeapi_wrapper.dart';

abstract class FutureBuilderWidget<T> extends StatelessWidget {
  const FutureBuilderWidget({super.key});

  Future<Either<Error, T>> get future;
  Widget onWaiting(BuildContext context);
  Widget onError(BuildContext context, Error error);
  Widget onSuccess(BuildContext context, T value);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<Error, T>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return onWaiting(context);
          if (snapshot.hasError) return onError(context, snapshot.error as Error);
          if (snapshot.data!.isLeft) return onError(context, snapshot.data!.left);
          return onSuccess(context, snapshot.data!.right);
        });
  }
}

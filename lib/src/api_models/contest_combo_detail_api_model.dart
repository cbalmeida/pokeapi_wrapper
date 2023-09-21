import '../../pokeapi_wrapper.dart';

class ContestComboDetailApiModel extends ApiModel {
  static var mapper = ContestComboDetailApiModelMapper();

  final List<MoveApiResource> useBefore;

  final List<MoveApiResource> useAfter;

  const ContestComboDetailApiModel({
    required this.useBefore,
    required this.useAfter,
  });
}

class ContestComboDetailApiModelMapper extends Mapper<ContestComboDetailApiModel> {
  @override
  ContestComboDetailApiModel fromMap(Map<String, dynamic>? map) {
    return ContestComboDetailApiModel(
      useBefore: MoveApiResource.mapper.fromList(map?['use_before']),
      useAfter: MoveApiResource.mapper.fromList(map?['use_after']),
    );
  }

  @override
  Map<String, dynamic> toMap(ContestComboDetailApiModel value) {
    return {
      'use_before': MoveApiResource.mapper.toList(value.useBefore),
      'use_after': MoveApiResource.mapper.toList(value.useAfter),
    };
  }
}

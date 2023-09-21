import '../api_models.dart';
import '../core.dart';

class ContestComboSetsApiModel extends ApiModel {
  static var mapper = ContestComboSetsApiModelMapper();

  final ContestComboDetailApiModel normalValue;

  final ContestComboDetailApiModel superValue;

  const ContestComboSetsApiModel({
    required this.normalValue,
    required this.superValue,
  });
}

class ContestComboSetsApiModelMapper extends Mapper<ContestComboSetsApiModel> {
  @override
  ContestComboSetsApiModel fromMap(Map<String, dynamic>? map) {
    return ContestComboSetsApiModel(
      normalValue: ContestComboDetailApiModel.mapper.fromMap(map?['normal']),
      superValue: ContestComboDetailApiModel.mapper.fromMap(map?['super']),
    );
  }

  @override
  Map<String, dynamic> toMap(ContestComboSetsApiModel value) {
    return {
      'normal': ContestComboDetailApiModel.mapper.toMap(value.normalValue),
      'super': ContestComboDetailApiModel.mapper.toMap(value.superValue),
    };
  }
}

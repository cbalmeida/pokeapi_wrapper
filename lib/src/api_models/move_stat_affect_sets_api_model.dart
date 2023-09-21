import '../api_models.dart';
import '../core.dart';

class MoveStatAffectSetsApiModel extends ApiModel {
  static var mapper = MoveStatAffectSetsApiModelMapper();

  final List<MoveStatAffectApiModel> increase;

  final List<MoveStatAffectApiModel> decrease;

  const MoveStatAffectSetsApiModel({
    required this.increase,
    required this.decrease,
  });
}

class MoveStatAffectSetsApiModelMapper extends Mapper<MoveStatAffectSetsApiModel> {
  @override
  MoveStatAffectSetsApiModel fromMap(Map<String, dynamic>? map) {
    return MoveStatAffectSetsApiModel(
      increase: MoveStatAffectApiModel.mapper.fromList(map?['increase']),
      decrease: MoveStatAffectApiModel.mapper.fromList(map?['decrease']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveStatAffectSetsApiModel value) {
    return {
      'increase': MoveStatAffectApiModel.mapper.fromList(value.increase),
      'decrease': MoveStatAffectApiModel.mapper.fromList(value.decrease),
    };
  }
}

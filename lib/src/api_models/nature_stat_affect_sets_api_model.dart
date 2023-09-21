import '../api_models.dart';
import '../core.dart';

class NatureStatAffectSetsApiModel extends ApiModel {
  static var mapper = NatureStatAffectSetsApiModelMapper();

  final List<MoveStatAffectApiModel> increase;

  final List<MoveStatAffectApiModel> decrease;

  const NatureStatAffectSetsApiModel({
    required this.increase,
    required this.decrease,
  });
}

class NatureStatAffectSetsApiModelMapper extends Mapper<NatureStatAffectSetsApiModel> {
  @override
  NatureStatAffectSetsApiModel fromMap(Map<String, dynamic>? map) {
    return NatureStatAffectSetsApiModel(
      increase: MoveStatAffectApiModel.mapper.fromList(map?['increase']),
      decrease: MoveStatAffectApiModel.mapper.fromList(map?['decrease']),
    );
  }

  @override
  Map<String, dynamic> toMap(NatureStatAffectSetsApiModel value) {
    return {
      'increase': MoveStatAffectApiModel.mapper.toList(value.increase),
      'decrease': MoveStatAffectApiModel.mapper.toList(value.decrease),
    };
  }
}

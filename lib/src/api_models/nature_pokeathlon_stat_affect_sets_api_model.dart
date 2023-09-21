import '../api_models.dart';
import '../core.dart';

class NaturePokeathlonStatAffectSetsApiModel extends ApiModel {
  static var mapper = NaturePokeathlonStatAffectSetsMapper();

  final List<NaturePokeathlonStatAffectApiModel> increase;

  final List<NaturePokeathlonStatAffectApiModel> decrease;

  const NaturePokeathlonStatAffectSetsApiModel({
    required this.increase,
    required this.decrease,
  });
}

class NaturePokeathlonStatAffectSetsMapper extends Mapper<NaturePokeathlonStatAffectSetsApiModel> {
  @override
  NaturePokeathlonStatAffectSetsApiModel fromMap(Map<String, dynamic>? map) {
    return NaturePokeathlonStatAffectSetsApiModel(
      increase: NaturePokeathlonStatAffectApiModel.mapper.fromList(map?['increase']),
      decrease: NaturePokeathlonStatAffectApiModel.mapper.fromList(map?['decrease']),
    );
  }

  @override
  Map<String, dynamic> toMap(NaturePokeathlonStatAffectSetsApiModel value) {
    return {
      'increase': NaturePokeathlonStatAffectApiModel.mapper.toList(value.increase),
      'decrease': NaturePokeathlonStatAffectApiModel.mapper.toList(value.decrease),
    };
  }
}

import '../../pokeapi_wrapper.dart';

class NaturePokeathlonStatAffectApiModel extends ApiModel {
  static var mapper = NaturePokeathlonStatAffectMapper();

  final int maxChange;

  final NatureApiResource nature;

  const NaturePokeathlonStatAffectApiModel({
    required this.maxChange,
    required this.nature,
  });
}

class NaturePokeathlonStatAffectMapper extends Mapper<NaturePokeathlonStatAffectApiModel> {
  @override
  NaturePokeathlonStatAffectApiModel fromMap(Map<String, dynamic>? map) {
    return NaturePokeathlonStatAffectApiModel(
      maxChange: map?['max_change'] ?? 0,
      nature: NatureApiResource.mapper.fromMap(map?['nature']),
    );
  }

  @override
  Map<String, dynamic> toMap(NaturePokeathlonStatAffectApiModel value) {
    return {
      'max_change': value.maxChange,
      'nature': NatureApiResource.mapper.toMap(value.nature),
    };
  }
}

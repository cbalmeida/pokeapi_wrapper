import '../api_models.dart';
import '../core.dart';

class PokeathlonStatApiModel extends ApiModel {
  static var mapper = PokeathlonStatApiModelMapper();

  final int id;

  final String name;

  final List<NameApiModel> names;

  final NaturePokeathlonStatAffectSetsApiModel affectingNatures;

  const PokeathlonStatApiModel({
    required this.id,
    required this.name,
    required this.names,
    required this.affectingNatures,
  });
}

class PokeathlonStatApiModelMapper extends Mapper<PokeathlonStatApiModel> {
  @override
  PokeathlonStatApiModel fromMap(Map<String, dynamic>? map) {
    return PokeathlonStatApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      names: NameApiModel.mapper.fromList(map?['names']),
      affectingNatures: NaturePokeathlonStatAffectSetsApiModel.mapper.fromMap(map?['affecting_natures']),
    );
  }

  @override
  Map<String, dynamic> toMap(PokeathlonStatApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'names': NameApiModel.mapper.toList(value.names),
      'affecting_natures': NaturePokeathlonStatAffectSetsApiModel.mapper.toMap(value.affectingNatures),
    };
  }
}

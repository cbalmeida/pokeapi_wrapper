import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class CharacteristicApiModel extends ApiModel {
  static var mapper = CharacteristicApiModelMapper();

  final int id;

  final int geneModulo;

  final List<int> possibleValues;

  final StatApiResource highestStat;

  final List<DescriptionApiModel> descriptions;

  const CharacteristicApiModel({
    required this.id,
    required this.geneModulo,
    required this.possibleValues,
    required this.highestStat,
    required this.descriptions,
  });
}

class CharacteristicApiModelMapper extends Mapper<CharacteristicApiModel> {
  @override
  CharacteristicApiModel fromMap(Map<String, dynamic>? map) {
    return CharacteristicApiModel(
      id: map?['id'] ?? 0,
      geneModulo: map?['gene_modulo'] ?? 0,
      possibleValues: map?['possible_values']?.cast<int>(),
      highestStat: StatApiResource.mapper.fromMap(map?['highest_stat']),
      descriptions: DescriptionApiModel.mapper.fromList(map?['descriptions']),
    );
  }

  @override
  Map<String, dynamic> toMap(CharacteristicApiModel value) {
    return {
      'id': value.id,
      'gene_modulo': value.geneModulo,
      'possible_values': value.possibleValues,
      'highest_stat': StatApiResource.mapper.toMap(value.highestStat),
      'descriptions': DescriptionApiModel.mapper.toList(value.descriptions),
    };
  }
}

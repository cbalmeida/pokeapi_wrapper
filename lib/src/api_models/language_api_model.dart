import '../core.dart';
import 'name_api_model.dart';

class LanguageApiModel extends ApiModel {
  static var mapper = LanguageApiModelMapper();

  final int id;

  final String name;

  final bool official;

  final String iso639;

  final String iso3166;

  final List<NameApiModel> names;

  const LanguageApiModel({
    required this.id,
    required this.name,
    required this.official,
    required this.iso639,
    required this.iso3166,
    required this.names,
  });
}

class LanguageApiModelMapper extends Mapper<LanguageApiModel> {
  @override
  LanguageApiModel fromMap(Map<String, dynamic>? map) {
    return LanguageApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      official: map?['official'] ?? false,
      iso639: map?['iso639'] ?? '',
      iso3166: map?['iso3166'] ?? '',
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(LanguageApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'official': value.official,
      'iso639': value.iso639,
      'iso3166': value.iso3166,
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

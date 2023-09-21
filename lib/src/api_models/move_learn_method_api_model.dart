import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class MoveLearnMethodApiModel extends ApiModel {
  static var mapper = MoveLearnMethodApiModelMapper();

  final int id;

  final String name;

  final List<DescriptionApiModel> descriptions;

  final List<NameApiModel> names;

  final List<VersionGroupApiResource> versionGroups;

  const MoveLearnMethodApiModel({
    required this.id,
    required this.name,
    required this.descriptions,
    required this.names,
    required this.versionGroups,
  });
}

class MoveLearnMethodApiModelMapper extends Mapper<MoveLearnMethodApiModel> {
  @override
  MoveLearnMethodApiModel fromMap(Map<String, dynamic>? map) {
    return MoveLearnMethodApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      descriptions: DescriptionApiModel.mapper.fromList(map?['descriptions']),
      names: NameApiModel.mapper.fromList(map?['names']),
      versionGroups: VersionGroupApiResource.mapper.fromList(map?['version_groups']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveLearnMethodApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'descriptions': DescriptionApiModel.mapper.toList(value.descriptions),
      'names': NameApiModel.mapper.toList(value.names),
      'version_groups': VersionGroupApiResource.mapper.toList(value.versionGroups),
    };
  }
}

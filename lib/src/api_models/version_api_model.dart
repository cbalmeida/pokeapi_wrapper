import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class VersionApiModel extends ApiModel {
  static var mapper = VersionApiModelMapper();

  final int id;

  final String name;

  final List<NameApiModel> names;

  final VersionGroupApiResource versionGroup;

  const VersionApiModel({
    required this.id,
    required this.name,
    required this.names,
    required this.versionGroup,
  });
}

class VersionApiModelMapper extends Mapper<VersionApiModel> {
  @override
  VersionApiModel fromMap(Map<String, dynamic>? map) {
    return VersionApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      names: NameApiModel.mapper.fromList(map?['names']),
      versionGroup: VersionGroupApiResource.mapper.fromMap(map?['version_group']),
    );
  }

  @override
  Map<String, dynamic> toMap(VersionApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'names': NameApiModel.mapper.toList(value.names),
      'version_group': VersionGroupApiResource.mapper.toMap(value.versionGroup),
    };
  }
}

import '../../pokeapi_wrapper.dart';

class MachineVersionDetailApiModel extends ApiModel {
  static var mapper = MachineVersionDetailApiModelMapper();

  final MachineApiResource machine;

  final VersionGroupApiResource versionGroup;

  const MachineVersionDetailApiModel({
    required this.machine,
    required this.versionGroup,
  });
}

class MachineVersionDetailApiModelMapper extends Mapper<MachineVersionDetailApiModel> {
  @override
  MachineVersionDetailApiModel fromMap(Map<String, dynamic>? map) {
    return MachineVersionDetailApiModel(
      machine: MachineApiResource.mapper.fromMap(map?['machine']),
      versionGroup: VersionGroupApiResource.mapper.fromMap(map?['version_group']),
    );
  }

  @override
  Map<String, dynamic> toMap(MachineVersionDetailApiModel value) {
    return {
      'machine': MachineApiResource.mapper.toMap(value.machine),
      'version_group': VersionGroupApiResource.mapper.toMap(value.versionGroup),
    };
  }
}

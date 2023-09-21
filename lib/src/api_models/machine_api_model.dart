import '../../pokeapi_wrapper.dart';

class MachineApiModel extends ApiModel {
  static var mapper = MachineApiModelMapper();

  final int id;

  final ItemApiResource item;

  final MoveApiResource move;

  final VersionGroupApiResource versionGroup;

  const MachineApiModel({
    required this.id,
    required this.item,
    required this.move,
    required this.versionGroup,
  });
}

class MachineApiModelMapper extends Mapper<MachineApiModel> {
  @override
  MachineApiModel fromMap(Map<String, dynamic>? map) {
    return MachineApiModel(
      id: map?['id'] ?? 0,
      item: ItemApiResource.mapper.fromMap(map?['item']),
      move: MoveApiResource.mapper.fromMap(map?['move']),
      versionGroup: VersionGroupApiResource.mapper.fromMap(map?['version_group']),
    );
  }

  @override
  Map<String, dynamic> toMap(MachineApiModel value) {
    return {
      'id': value.id,
      'item': ItemApiResource.mapper.toMap(value.item),
      'move': MoveApiResource.mapper.toMap(value.move),
      'version_group': VersionGroupApiResource.mapper.toMap(value.versionGroup),
    };
  }
}

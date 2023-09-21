import '../../pokeapi_wrapper.dart';

class MoveStatChangeApiModel extends ApiModel {
  static var mapper = MoveStatChangeApiModelMapper();

  final int change;

  final StatApiResource stat;

  const MoveStatChangeApiModel({
    required this.change,
    required this.stat,
  });
}

class MoveStatChangeApiModelMapper extends Mapper<MoveStatChangeApiModel> {
  @override
  MoveStatChangeApiModel fromMap(Map<String, dynamic>? map) {
    return MoveStatChangeApiModel(
      change: map?['change'] ?? 0,
      stat: StatApiResource.mapper.fromMap(map?['stat']),
    );
  }

  @override
  Map<String, dynamic> toMap(MoveStatChangeApiModel value) {
    return {
      'change': value.change,
      'stat': StatApiResource.mapper.toMap(value.stat),
    };
  }
}

import '../../pokeapi_wrapper.dart';

class VersionGameIndexApiModel extends ApiModel {
  static var mapper = VersionGameIndexApiModelMapper();

  final int gameIndex;

  final VersionApiResource version;

  const VersionGameIndexApiModel({
    required this.gameIndex,
    required this.version,
  });
}

class VersionGameIndexApiModelMapper extends Mapper<VersionGameIndexApiModel> {
  @override
  VersionGameIndexApiModel fromMap(Map<String, dynamic>? map) {
    return VersionGameIndexApiModel(
      gameIndex: map?['game_index'] ?? 0,
      version: VersionApiResource.mapper.fromMap(map?['version']),
    );
  }

  @override
  Map<String, dynamic> toMap(VersionGameIndexApiModel value) {
    return {
      'game_index': value.gameIndex,
      'version': VersionApiResource.mapper.toMap(value.version),
    };
  }
}

import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class NatureApiModel extends ApiModel {
  static var mapper = NatureApiModelMapper();

  final int id;

  final String name;

  final StatApiResource decreasedStat;

  final StatApiResource increasedStat;

  final BerryFlavorApiResource hatesFlavor;

  final BerryFlavorApiResource likesFlavor;

  final List<NatureStatChangeApiModel> pokeathlonStatChanges;

  final List<MoveBattleStylePreferenceApiModel> moveBattleStylePreferences;

  final List<NameApiModel> names;

  const NatureApiModel({
    required this.id,
    required this.name,
    required this.decreasedStat,
    required this.increasedStat,
    required this.hatesFlavor,
    required this.likesFlavor,
    required this.pokeathlonStatChanges,
    required this.moveBattleStylePreferences,
    required this.names,
  });
}

class NatureApiModelMapper extends Mapper<NatureApiModel> {
  @override
  NatureApiModel fromMap(Map<String, dynamic>? map) {
    return NatureApiModel(
      id: map?['id'] ?? 0,
      name: map?['name'] ?? '',
      decreasedStat: StatApiResource.mapper.fromMap(map?['decreased_stat']),
      increasedStat: StatApiResource.mapper.fromMap(map?['increased_stat']),
      hatesFlavor: BerryFlavorApiResource.mapper.fromMap(map?['hates_flavor']),
      likesFlavor: BerryFlavorApiResource.mapper.fromMap(map?['likes_flavor']),
      pokeathlonStatChanges: NatureStatChangeApiModel.mapper.fromList(map?['pokeathlon_stat_changes']),
      moveBattleStylePreferences: MoveBattleStylePreferenceApiModel.mapper.fromList(map?['move_battle_style_preferences']),
      names: NameApiModel.mapper.fromList(map?['names']),
    );
  }

  @override
  Map<String, dynamic> toMap(NatureApiModel value) {
    return {
      'id': value.id,
      'name': value.name,
      'decreased_stat': StatApiResource.mapper.toMap(value.decreasedStat),
      'increased_stat': StatApiResource.mapper.toMap(value.increasedStat),
      'hates_flavor': BerryFlavorApiResource.mapper.toMap(value.hatesFlavor),
      'likes_flavor': BerryFlavorApiResource.mapper.toMap(value.likesFlavor),
      'pokeathlon_stat_changes': NatureStatChangeApiModel.mapper.toList(value.pokeathlonStatChanges),
      'move_battle_style_preferences': MoveBattleStylePreferenceApiModel.mapper.toList(value.moveBattleStylePreferences),
      'names': NameApiModel.mapper.toList(value.names),
    };
  }
}

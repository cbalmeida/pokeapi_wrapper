import '../../pokeapi_wrapper.dart';
import '../api_models.dart';

class EvolutionChainApiModel extends ApiModel {
  static var mapper = EvolutionChainModelMapper();

  final int id;

  final ItemApiResource babyTriggerItem;

  final ChainLinkApiModel chain;

  const EvolutionChainApiModel({
    required this.id,
    required this.babyTriggerItem,
    required this.chain,
  });
}

class EvolutionChainModelMapper extends Mapper<EvolutionChainApiModel> {
  @override
  EvolutionChainApiModel fromMap(Map<String, dynamic>? map) {
    return EvolutionChainApiModel(
      id: map?['id'] ?? 0,
      babyTriggerItem: ItemApiResource.mapper.fromMap(map?['baby_trigger_item']),
      chain: ChainLinkApiModel.mapper.fromMap(map?['chain']),
    );
  }

  @override
  Map<String, dynamic> toMap(EvolutionChainApiModel value) {
    return {
      'id': value.id,
      'baby_trigger_item': ItemApiResource.mapper.toMap(value.babyTriggerItem),
      'chain': ChainLinkApiModel.mapper.toMap(value.chain),
    };
  }
}

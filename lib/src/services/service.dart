import 'dart:typed_data';

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../repositories.dart';
import '../services.dart';
import 'cache_progress.dart';

class Service extends IService {
  final IRepository repository;

  Service(this.repository);

  Future<Either<Error, String?>> _getJson(String url) async {
    return repository.get(url);
  }

  Future<Either<Error, T>> _get<T>(String url, Mapper<T> mapper) async {
    String json = "";
    try {
      Either<Error, String?> response = await _getJson(url);
      if (response.isLeft) {
        return Left(response.left);
      }
      json = response.right!;
      T model = mapper.fromJson(json);
      return Right(model);
    } catch (e) {
      return Left(StateError("$json - $e"));
    }
  }

  Future<Either<Error, List<T>>> _getList<T>(String url, Mapper<T> mapper) async {
    String json = "";
    try {
      Either<Error, String?> response = await _getJson(url);
      if (response.isLeft) {
        return Left(response.left);
      }
      json = response.right!;
      NamedApiResourceList namedApiResourceList = NamedApiResourceList.mapper.fromJson(json);
      return Right(mapper.fromList(namedApiResourceList.results));
    } catch (e) {
      return Left(StateError("$json - $e"));
    }
  }

  /// cache's methods

  @override
  Future<Either<Error, Uint8List>> getContent({required String url}) {
    return repository.getContent(url);
  }

  @override
  Future<int> clearCache() async {
    onProgress(String url, int progress) => clearCacheProgressNotifier.value = CacheProgress("", url, progress);
    await repository.clearCache(onProgress);
    onProgress("", 0);
    return cacheSize;
  }

  @override
  Future<int> get cacheSize => repository.cacheSize;

  /// api's methods

  @override
  getBerry(String url) => _get(url, BerryApiModel.mapper);

  @override
  getBerryList({int? offSet = 0, int? limit = 100000}) => _getList("${Berry.adapter.baseUrl}/?offset=$offSet&limit=$limit", BerryApiResource.mapper);

  @override
  getBerryFirmness(String url) => _get(url, BerryFirmnessApiModel.mapper);

  @override
  getBerryFirmnessList({int? offSet = 0, int? limit = 100000}) => _getList("${BerryFirmness.adapter.baseUrl}/?offset=$offSet&limit=$limit", BerryFirmnessApiResource.mapper);

  @override
  getBerryFlavor(String url) => _get(url, BerryFlavorApiModel.mapper);

  @override
  getBerryFlavorList({int? offSet = 0, int? limit = 100000}) => _getList("${BerryFlavor.adapter.baseUrl}/?offset=$offSet&limit=$limit", BerryFlavorApiResource.mapper);

  @override
  getContestType(String url) => _get(url, ContestTypeApiModel.mapper);

  @override
  getContestTypeList({int? offSet = 0, int? limit = 100000}) => _getList("${ContestType.adapter.baseUrl}/?offset=$offSet&limit=$limit", ContestTypeApiResource.mapper);

  @override
  getContestEffect(String url) => _get(url, ContestEffectApiModel.mapper);

  @override
  getContestEffectList({int? offSet = 0, int? limit = 100000}) => _getList("${ContestEffect.adapter.baseUrl}/?offset=$offSet&limit=$limit", ContestEffectApiResource.mapper);

  @override
  getSuperContestEffect(String url) => _get(url, SuperContestEffectApiModel.mapper);

  @override
  getSuperContestEffectList({int? offSet = 0, int? limit = 100000}) => _getList("${SuperContestEffect.adapter.baseUrl}/?offset=$offSet&limit=$limit", SuperContestEffectApiResource.mapper);

  @override
  getEncounterMethod(String url) => _get(url, EncounterMethodApiModel.mapper);

  @override
  getEncounterMethodList({int? offSet = 0, int? limit = 100000}) => _getList("${EncounterMethod.adapter.baseUrl}/?offset=$offSet&limit=$limit", EncounterMethodApiResource.mapper);

  @override
  getEncounterCondition(String url) => _get(url, EncounterConditionApiModel.mapper);

  @override
  getEncounterConditionList({int? offSet = 0, int? limit = 100000}) => _getList("${EncounterCondition.adapter.baseUrl}/?offset=$offSet&limit=$limit", EncounterConditionApiResource.mapper);

  @override
  getEncounterConditionValue(String url) => _get(url, EncounterConditionValueApiModel.mapper);

  @override
  getEncounterConditionValueList({int? offSet = 0, int? limit = 100000}) => _getList("${EncounterConditionValue.adapter.baseUrl}/?offset=$offSet&limit=$limit", EncounterConditionValueApiResource.mapper);

  @override
  getEvolutionChain(String url) => _get(url, EvolutionChainApiModel.mapper);

  @override
  getEvolutionChainList({int? offSet = 0, int? limit = 100000}) => _getList("${EvolutionChain.adapter.baseUrl}/?offset=$offSet&limit=$limit", EvolutionChainApiResource.mapper);

  @override
  getEvolutionTrigger(String url) => _get(url, EvolutionTriggerApiModel.mapper);

  @override
  getEvolutionTriggerList({int? offSet = 0, int? limit = 100000}) => _getList("${EvolutionTrigger.adapter.baseUrl}/?offset=$offSet&limit=$limit", EvolutionTriggerApiResource.mapper);

  @override
  getGeneration(String url) => _get(url, GenerationApiModel.mapper);

  @override
  getGenerationList({int? offSet = 0, int? limit = 100000}) => _getList("${Generation.adapter.baseUrl}/?offset=$offSet&limit=$limit", GenerationApiResource.mapper);

  @override
  getPokedex(String url) => _get(url, PokedexApiModel.mapper);

  @override
  getPokedexList({int? offSet = 0, int? limit = 100000}) => _getList("${Pokedex.adapter.baseUrl}/?offset=$offSet&limit=$limit", PokedexApiResource.mapper);

  @override
  getVersion(String url) => _get(url, VersionApiModel.mapper);

  @override
  getVersionList({int? offSet = 0, int? limit = 100000}) => _getList("${Version.adapter.baseUrl}/?offset=$offSet&limit=$limit", VersionApiResource.mapper);

  @override
  getVersionGroup(String url) => _get(url, VersionGroupApiModel.mapper);

  @override
  getVersionGroupList({int? offSet = 0, int? limit = 100000}) => _getList("${VersionGroup.adapter.baseUrl}/?offset=$offSet&limit=$limit", VersionGroupApiResource.mapper);

  @override
  getItem(String url) => _get(url, ItemApiModel.mapper);

  @override
  getItemList({int? offSet = 0, int? limit = 100000}) => _getList("${Item.adapter.baseUrl}/?offset=$offSet&limit=$limit", ItemApiResource.mapper);

  @override
  getItemAttribute(String url) => _get(url, ItemAttributeApiModel.mapper);

  @override
  getItemAttributeList({int? offSet = 0, int? limit = 100000}) => _getList("${ItemAttribute.adapter.baseUrl}/?offset=$offSet&limit=$limit", ItemAttributeApiResource.mapper);

  @override
  getItemCategory(String url) => _get(url, ItemCategoryApiModel.mapper);

  @override
  getItemCategoryList({int? offSet = 0, int? limit = 100000}) => _getList("${ItemCategory.adapter.baseUrl}/?offset=$offSet&limit=$limit", ItemCategoryApiResource.mapper);

  @override
  getItemFlingEffect(String url) => _get(url, ItemFlingEffectApiModel.mapper);

  @override
  getItemFlingEffectList({int? offSet = 0, int? limit = 100000}) => _getList("${ItemFlingEffect.adapter.baseUrl}/?offset=$offSet&limit=$limit", ItemFlingEffectApiResource.mapper);

  @override
  getItemPocket(String url) => _get(url, ItemPocketApiModel.mapper);

  @override
  getItemPocketList({int? offSet = 0, int? limit = 100000}) => _getList("${ItemPocket.adapter.baseUrl}/?offset=$offSet&limit=$limit", ItemPocketApiResource.mapper);

  @override
  getLocation(String url) => _get(url, LocationApiModel.mapper);

  @override
  getLocationList({int? offSet = 0, int? limit = 100000}) => _getList("${Location.adapter.baseUrl}/?offset=$offSet&limit=$limit", LocationApiResource.mapper);

  @override
  getLocationArea(String url) => _get(url, LocationAreaApiModel.mapper);

  @override
  getLocationAreaList({int? offSet = 0, int? limit = 100000}) => _getList("${LocationArea.adapter.baseUrl}/?offset=$offSet&limit=$limit", LocationAreaApiResource.mapper);

  @override
  getPalParkArea(String url) => _get(url, PalParkAreaApiModel.mapper);

  @override
  getPalParkAreaList({int? offSet = 0, int? limit = 100000}) => _getList("${PalParkArea.adapter.baseUrl}/?offset=$offSet&limit=$limit", PalParkAreaApiResource.mapper);

  @override
  getRegion(String url) => _get(url, RegionApiModel.mapper);

  @override
  getRegionList({int? offSet = 0, int? limit = 100000}) => _getList("${Region.adapter.baseUrl}/?offset=$offSet&limit=$limit", RegionApiResource.mapper);

  @override
  getMachine(String url) => _get(url, MachineApiModel.mapper);

  @override
  getMachineList({int? offSet = 0, int? limit = 100000}) => _getList("${Machine.adapter.baseUrl}/?offset=$offSet&limit=$limit", MachineApiResource.mapper);

  @override
  getMove(String url) => _get(url, MoveApiModel.mapper);

  @override
  getMoveList({int? offSet = 0, int? limit = 100000}) => _getList("${Move.adapter.baseUrl}/?offset=$offSet&limit=$limit", MoveApiResource.mapper);

  @override
  getMoveAilment(String url) => _get(url, MoveAilmentApiModel.mapper);

  @override
  getMoveAilmentList({int? offSet = 0, int? limit = 100000}) => _getList("${MoveAilment.adapter.baseUrl}/?offset=$offSet&limit=$limit", MoveAilmentApiResource.mapper);

  @override
  getMoveBattleStyle(String url) => _get(url, MoveBattleStyleApiModel.mapper);

  @override
  getMoveBattleStyleList({int? offSet = 0, int? limit = 100000}) => _getList("${MoveBattleStyle.adapter.baseUrl}/?offset=$offSet&limit=$limit", MoveBattleStyleApiResource.mapper);

  @override
  getMoveCategory(String url) => _get(url, MoveCategoryApiModel.mapper);

  @override
  getMoveCategoryList({int? offSet = 0, int? limit = 100000}) => _getList("${MoveCategory.adapter.baseUrl}/?offset=$offSet&limit=$limit", MoveCategoryApiResource.mapper);

  @override
  getMoveDamageClass(String url) => _get(url, MoveDamageClassApiModel.mapper);

  @override
  getMoveDamageClassList({int? offSet = 0, int? limit = 100000}) => _getList("${MoveDamageClass.adapter.baseUrl}/?offset=$offSet&limit=$limit", MoveDamageClassApiResource.mapper);

  @override
  getMoveLearnMethod(String url) => _get(url, MoveLearnMethodApiModel.mapper);

  @override
  getMoveLearnMethodList({int? offSet = 0, int? limit = 100000}) => _getList("${MoveLearnMethod.adapter.baseUrl}/?offset=$offSet&limit=$limit", MoveLearnMethodApiResource.mapper);

  @override
  getMoveTarget(String url) => _get(url, MoveTargetApiModel.mapper);

  @override
  getMoveTargetList({int? offSet = 0, int? limit = 100000}) => _getList("${MoveTarget.adapter.baseUrl}/?offset=$offSet&limit=$limit", MoveTargetApiResource.mapper);

  @override
  getAbility(String url) => _get(url, AbilityApiModel.mapper);

  @override
  getAbilityList({int? offSet = 0, int? limit = 100000}) => _getList("${Ability.adapter.baseUrl}/?offset=$offSet&limit=$limit", AbilityApiResource.mapper);

  @override
  getCharacteristic(String url) => _get(url, CharacteristicApiModel.mapper);

  @override
  getCharacteristicList({int? offSet = 0, int? limit = 100000}) => _getList("${Characteristic.adapter.baseUrl}/?offset=$offSet&limit=$limit", CharacteristicApiResource.mapper);

  @override
  getEggGroup(String url) => _get(url, EggGroupApiModel.mapper);

  @override
  getEggGroupList({int? offSet = 0, int? limit = 100000}) => _getList("${EggGroup.adapter.baseUrl}/?offset=$offSet&limit=$limit", EggGroupApiResource.mapper);

  @override
  getGender(String url) => _get(url, GenderApiModel.mapper);

  @override
  getGenderList({int? offSet = 0, int? limit = 100000}) => _getList("${Gender.adapter.baseUrl}/?offset=$offSet&limit=$limit", GenderApiResource.mapper);

  @override
  getGrowthRate(String url) => _get(url, GrowthRateApiModel.mapper);

  @override
  getGrowthRateList({int? offSet = 0, int? limit = 100000}) => _getList("${GrowthRate.adapter.baseUrl}/?offset=$offSet&limit=$limit", GrowthRateApiResource.mapper);

  @override
  getNature(String url) => _get(url, NatureApiModel.mapper);

  @override
  getNatureList({int? offSet = 0, int? limit = 100000}) => _getList("${Nature.adapter.baseUrl}/?offset=$offSet&limit=$limit", NatureApiResource.mapper);

  @override
  getPokeathlonStat(String url) => _get(url, PokeathlonStatApiModel.mapper);

  @override
  getPokeathlonStatList({int? offSet = 0, int? limit = 100000}) => _getList("${PokeathlonStat.adapter.baseUrl}/?offset=$offSet&limit=$limit", PokeathlonStatApiResource.mapper);

  @override
  getPokemon(String url) => _get(url, PokemonApiModel.mapper);

  @override
  getPokemonList({int? offSet = 0, int? limit = 100000}) => _getList("${Pokemon.adapter.baseUrl}/?offset=$offSet&limit=$limit", PokemonApiResource.mapper);

  @override
  getLocationAreaEncounter(String url) => _get(url, LocationAreaEncounterApiModel.mapper);

  @override
  getPokemonColor(String url) => _get(url, PokemonColorApiModel.mapper);

  @override
  getPokemonColorList({int? offSet = 0, int? limit = 100000}) => _getList("${PokemonColor.adapter.baseUrl}/?offset=$offSet&limit=$limit", PokemonColorApiResource.mapper);

  @override
  getPokemonForm(String url) => _get(url, PokemonFormApiModel.mapper);

  @override
  getPokemonFormList({int? offSet = 0, int? limit = 100000}) => _getList("${PokemonForm.adapter.baseUrl}/?offset=$offSet&limit=$limit", PokemonFormApiResource.mapper);

  @override
  getPokemonHabitat(String url) => _get(url, PokemonHabitatApiModel.mapper);

  @override
  getPokemonHabitatList({int? offSet = 0, int? limit = 100000}) => _getList("${PokemonHabitat.adapter.baseUrl}/?offset=$offSet&limit=$limit", PokemonHabitatApiResource.mapper);

  @override
  getPokemonShape(String url) => _get(url, PokemonShapeApiModel.mapper);

  @override
  getPokemonShapeList({int? offSet = 0, int? limit = 100000}) => _getList("${PokemonShape.adapter.baseUrl}/?offset=$offSet&limit=$limit", PokemonShapeApiResource.mapper);

  @override
  getPokemonSpecies(String url) => _get(url, PokemonSpeciesApiModel.mapper);

  @override
  getPokemonSpeciesList({int? offSet = 0, int? limit = 100000}) => _getList("${PokemonSpecies.adapter.baseUrl}/?offset=$offSet&limit=$limit", PokemonSpeciesApiResource.mapper);

  @override
  getStat(String url) => _get(url, StatApiModel.mapper);

  @override
  getStatList({int? offSet = 0, int? limit = 100000}) => _getList("${Stat.adapter.baseUrl}/?offset=$offSet&limit=$limit", StatApiResource.mapper);

  @override
  getType(String url) => _get(url, TypeApiModel.mapper);

  @override
  getTypeList({int? offSet = 0, int? limit = 100000}) => _getList("${Type.adapter.baseUrl}/?offset=$offSet&limit=$limit", TypeApiResource.mapper);

  @override
  getLanguage(String url) => _get(url, LanguageApiModel.mapper);

  @override
  getLanguageList({int? offSet = 0, int? limit = 100000}) => _getList("${Language.adapter.baseUrl}/?offset=$offSet&limit=$limit", LanguageApiResource.mapper);
}

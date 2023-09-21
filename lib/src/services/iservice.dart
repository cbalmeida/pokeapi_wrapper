import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import '../../pokeapi_wrapper.dart';
import '../api_models.dart';
import 'cache_progress.dart';

abstract class IService {
  /// cache methods

  Future<int> get cacheSize;

  ValueNotifier<CacheProgress> cacheAllProgressNotifier = ValueNotifier(CacheProgress('', '', 0));

  // Future<Either<Error, int>> cacheAll();

  Future<int> clearCache();

  ValueNotifier<CacheProgress> clearCacheProgressNotifier = ValueNotifier(CacheProgress('', '', 0));

  Future<Either<Error, Uint8List>> getContent({required String url});

  /// api's methods

  Future<Either<Error, BerryApiModel>> getBerry(String url);

  Future<Either<Error, List<BerryApiResource>>> getBerryList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, BerryFirmnessApiModel>> getBerryFirmness(String url);

  Future<Either<Error, List<BerryFirmnessApiResource>>> getBerryFirmnessList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, BerryFlavorApiModel>> getBerryFlavor(String url);

  Future<Either<Error, List<BerryFlavorApiResource>>> getBerryFlavorList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, ContestTypeApiModel>> getContestType(String url);

  Future<Either<Error, List<ContestTypeApiResource>>> getContestTypeList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, ContestEffectApiModel>> getContestEffect(String url);

  Future<Either<Error, List<ContestEffectApiResource>>> getContestEffectList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, SuperContestEffectApiModel>> getSuperContestEffect(String url);

  Future<Either<Error, List<SuperContestEffectApiResource>>> getSuperContestEffectList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, EncounterMethodApiModel>> getEncounterMethod(String url);

  Future<Either<Error, List<EncounterMethodApiResource>>> getEncounterMethodList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, EncounterConditionApiModel>> getEncounterCondition(String url);

  Future<Either<Error, List<EncounterConditionApiResource>>> getEncounterConditionList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, EncounterConditionValueApiModel>> getEncounterConditionValue(String url);

  Future<Either<Error, List<EncounterConditionValueApiResource>>> getEncounterConditionValueList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, EvolutionChainApiModel>> getEvolutionChain(String url);

  Future<Either<Error, List<EvolutionChainApiResource>>> getEvolutionChainList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, EvolutionTriggerApiModel>> getEvolutionTrigger(String url);

  Future<Either<Error, List<EvolutionTriggerApiResource>>> getEvolutionTriggerList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, GenerationApiModel>> getGeneration(String url);

  Future<Either<Error, List<GenerationApiResource>>> getGenerationList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, PokedexApiModel>> getPokedex(String url);

  Future<Either<Error, List<PokedexApiResource>>> getPokedexList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, VersionApiModel>> getVersion(String url);

  Future<Either<Error, List<VersionApiResource>>> getVersionList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, VersionGroupApiModel>> getVersionGroup(String url);

  Future<Either<Error, List<VersionGroupApiResource>>> getVersionGroupList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, ItemApiModel>> getItem(String url);

  Future<Either<Error, List<ItemApiResource>>> getItemList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, ItemAttributeApiModel>> getItemAttribute(String url);

  Future<Either<Error, List<ItemAttributeApiResource>>> getItemAttributeList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, ItemCategoryApiModel>> getItemCategory(String url);

  Future<Either<Error, List<ItemCategoryApiResource>>> getItemCategoryList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, ItemFlingEffectApiModel>> getItemFlingEffect(String url);

  Future<Either<Error, List<ItemFlingEffectApiResource>>> getItemFlingEffectList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, ItemPocketApiModel>> getItemPocket(String url);

  Future<Either<Error, List<ItemPocketApiResource>>> getItemPocketList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, LocationApiModel>> getLocation(String url);

  Future<Either<Error, List<LocationApiResource>>> getLocationList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, LocationAreaApiModel>> getLocationArea(String url);

  Future<Either<Error, List<LocationAreaApiResource>>> getLocationAreaList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, PalParkAreaApiModel>> getPalParkArea(String url);

  Future<Either<Error, List<PalParkAreaApiResource>>> getPalParkAreaList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, RegionApiModel>> getRegion(String url);

  Future<Either<Error, List<RegionApiResource>>> getRegionList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, MachineApiModel>> getMachine(String url);

  Future<Either<Error, List<MachineApiResource>>> getMachineList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, MoveApiModel>> getMove(String url);

  Future<Either<Error, List<MoveApiResource>>> getMoveList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, MoveAilmentApiModel>> getMoveAilment(String url);

  Future<Either<Error, List<MoveAilmentApiResource>>> getMoveAilmentList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, MoveBattleStyleApiModel>> getMoveBattleStyle(String url);

  Future<Either<Error, List<MoveBattleStyleApiResource>>> getMoveBattleStyleList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, MoveCategoryApiModel>> getMoveCategory(String url);

  Future<Either<Error, List<MoveCategoryApiResource>>> getMoveCategoryList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, MoveDamageClassApiModel>> getMoveDamageClass(String url);

  Future<Either<Error, List<MoveDamageClassApiResource>>> getMoveDamageClassList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, MoveLearnMethodApiModel>> getMoveLearnMethod(String url);

  Future<Either<Error, List<MoveLearnMethodApiResource>>> getMoveLearnMethodList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, MoveTargetApiModel>> getMoveTarget(String url);

  Future<Either<Error, List<MoveTargetApiResource>>> getMoveTargetList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, AbilityApiModel>> getAbility(String url);

  Future<Either<Error, List<AbilityApiResource>>> getAbilityList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, CharacteristicApiModel>> getCharacteristic(String url);

  Future<Either<Error, List<CharacteristicApiResource>>> getCharacteristicList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, EggGroupApiModel>> getEggGroup(String url);

  Future<Either<Error, List<EggGroupApiResource>>> getEggGroupList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, GenderApiModel>> getGender(String url);

  Future<Either<Error, List<GenderApiResource>>> getGenderList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, GrowthRateApiModel>> getGrowthRate(String url);

  Future<Either<Error, List<GrowthRateApiResource>>> getGrowthRateList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, NatureApiModel>> getNature(String url);

  Future<Either<Error, List<NatureApiResource>>> getNatureList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, PokeathlonStatApiModel>> getPokeathlonStat(String url);

  Future<Either<Error, List<PokeathlonStatApiResource>>> getPokeathlonStatList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, PokemonApiModel>> getPokemon(String url);

  Future<Either<Error, List<PokemonApiResource>>> getPokemonList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, LocationAreaEncounterApiModel>> getLocationAreaEncounter(String url);

  Future<Either<Error, PokemonColorApiModel>> getPokemonColor(String url);

  Future<Either<Error, List<PokemonColorApiResource>>> getPokemonColorList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, PokemonFormApiModel>> getPokemonForm(String url);

  Future<Either<Error, List<PokemonFormApiResource>>> getPokemonFormList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, PokemonHabitatApiModel>> getPokemonHabitat(String url);

  Future<Either<Error, List<PokemonHabitatApiResource>>> getPokemonHabitatList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, PokemonShapeApiModel>> getPokemonShape(String url);

  Future<Either<Error, List<PokemonShapeApiResource>>> getPokemonShapeList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, PokemonSpeciesApiModel>> getPokemonSpecies(String url);

  Future<Either<Error, List<PokemonSpeciesApiResource>>> getPokemonSpeciesList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, StatApiModel>> getStat(String url);

  Future<Either<Error, List<StatApiResource>>> getStatList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, TypeApiModel>> getType(String url);

  Future<Either<Error, List<TypeApiResource>>> getTypeList({int? offSet = 0, int? limit = 100000});

  Future<Either<Error, LanguageApiModel>> getLanguage(String url);

  Future<Either<Error, List<LanguageApiResource>>> getLanguageList({int? offSet = 0, int? limit = 100000});
}

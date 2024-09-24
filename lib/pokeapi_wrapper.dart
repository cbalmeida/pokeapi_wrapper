library pokeapi_wrapper;

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:pokeapi_wrapper/src/caches.dart';
import 'package:pokeapi_wrapper/src/core.dart';
import 'package:pokeapi_wrapper/src/models.dart';
import 'package:pokeapi_wrapper/src/repositories.dart';
import 'package:pokeapi_wrapper/src/services.dart';
import 'package:pokeapi_wrapper/src/services/cache_progress.dart';

export 'package:pokeapi_wrapper/src/core.dart';
export 'package:pokeapi_wrapper/src/extensions.dart';
export 'package:pokeapi_wrapper/src/models.dart';
export 'package:pokeapi_wrapper/src/services.dart';
export 'package:pokeapi_wrapper/src/widgets.dart';

class PokeApi {
  PokeApi._();

  static bool _useHiveAsLocalCache = false;
  static bool get useHiveAsLocalCache => _useHiveAsLocalCache;
  static set useHiveAsLocalCache(bool value) {
    _useHiveAsLocalCache = value;
    _repository = null;
  }

  //#region Service

  static IRepository? _repository;
  @visibleForTesting
  static IRepository get repository => _repository ??= Repository(useHiveAsLocalCache ? CacheHive() : CacheSharedPrefs());
  @visibleForTesting
  static set repository(IRepository value) {
    _repository = value;
    _serviceObject = null;
  }

  static IService? _serviceObject;
  static IService get _service => _serviceObject ??= Service(repository);

  //#endregion

  //#region Cache

  /// Returns the size of cached data in bytes.
  static Future<int> get cacheSize => _service.cacheSize;

  /// Clears the cached data and returns the size in bytes that has been freed.
  static Future<int> clearCache() => _service.clearCache();

  /// Shows the progress of the cleaning cache process.
  static ValueNotifier<CacheProgress> get clearCacheProgressNotifier => _service.clearCacheProgressNotifier;

  /// Fetches the content of the [url].
  static Future<Either<Error, Uint8List>> getContent({required String url}) => _service.getContent(url: url);

  //#endregion

  //#region Berries

  /// Fetches a list of berries urls. Each berry can be fetched later by calling [getBerry(apiResource)].
  static Future<Either<Error, List<BerryApiResource>>> getBerryList({int? offSet = 0, int? limit = 100000}) => Berry.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a berry by its [url].
  static Future<Either<Error, Berry>> getBerry(BerryApiResource apiResource) => Berry.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of berry firmness urls. Each berry firmness can be fetched later by calling [getBerryFirmness(apiResource)].
  static Future<Either<Error, List<BerryFirmnessApiResource>>> getBerryFirmnessList({int? offSet = 0, int? limit = 100000}) => BerryFirmness.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a berry firmness by its [url].
  static Future<Either<Error, BerryFirmness>> getBerryFirmness(BerryFirmnessApiResource apiResource) => BerryFirmness.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of berry flavors urls. Each berry flavor can be fetched later by calling [getBerryFlavor(apiResource)].
  static Future<Either<Error, List<BerryFlavorApiResource>>> getBerryFlavorList({int? offSet = 0, int? limit = 100000}) => BerryFlavor.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a berry flavor by its [url].
  static Future<Either<Error, BerryFlavor>> getBerryFlavor(BerryFlavorApiResource apiResource) => BerryFlavor.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  //#endregion

  //#region Contests

  /// Fetches a list of contest types urls. Each contest type can be fetched later by calling [getContestType(apiResource)].
  static Future<Either<Error, List<ContestTypeApiResource>>> getContestTypeList({int? offSet = 0, int? limit = 100000}) => ContestType.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a contest type by its [url].
  static Future<Either<Error, ContestType>> getContestType(ContestTypeApiResource apiResource) => ContestType.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of contest effects urls. Each contest effect can be fetched later by calling [getContestEffect(apiResource)].
  static Future<Either<Error, List<ContestEffectApiResource>>> getContestEffectList({int? offSet = 0, int? limit = 100000}) => ContestEffect.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a contest effect by its [url].
  static Future<Either<Error, ContestEffect>> getContestEffect(ContestEffectApiResource apiResource) => ContestEffect.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of super contest effects urls. Each super contest effect can be fetched later by calling [getSuperContestEffect(apiResource)].
  static Future<Either<Error, List<SuperContestEffectApiResource>>> getSuperContestEffectList({int? offSet = 0, int? limit = 100000}) => SuperContestEffect.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a super contest effect by its [url].
  static Future<Either<Error, SuperContestEffect>> getSuperContestEffect(SuperContestEffectApiResource apiResource) => SuperContestEffect.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  //#endregion

  //#region Encounters

  /// Fetches a list of encounter methods urls. Each encounter method can be fetched later by calling [getEncounterMethod(apiResource)].
  static Future<Either<Error, List<EncounterMethodApiResource>>> getEncounterMethodList({int? offSet = 0, int? limit = 100000}) => EncounterMethod.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a encounter method by its [url].
  static Future<Either<Error, EncounterMethod>> getEncounterMethod(EncounterMethodApiResource apiResource) => EncounterMethod.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of encounter conditions urls. Each encounter condition can be fetched later by calling [getEncounterCondition(apiResource)].
  static Future<Either<Error, List<EncounterConditionApiResource>>> getEncounterConditionList({int? offSet = 0, int? limit = 100000}) => EncounterCondition.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a encounter condition by its [url].
  static Future<Either<Error, EncounterCondition>> getEncounterCondition(EncounterConditionApiResource apiResource) => EncounterCondition.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of encounter condition values urls. Each encounter condition value can be fetched later by calling [getEncounterConditionValue(apiResource)].
  static Future<Either<Error, List<EncounterConditionValueApiResource>>> getEncounterConditionValueList({int? offSet = 0, int? limit = 100000}) => EncounterConditionValue.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a encounter condition value by its [url].
  static Future<Either<Error, EncounterConditionValue>> getEncounterConditionValue(EncounterConditionValueApiResource apiResource) => EncounterConditionValue.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  //#endregion

  //#region Evolution

  /// Fetches a list of evolution chains urls. Each evolution chain can be fetched later by calling [getEvolutionChain(apiResource)].
  static Future<Either<Error, List<EvolutionChainApiResource>>> getEvolutionChainList({int? offSet = 0, int? limit = 100000}) => EvolutionChain.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a evolution chain by its [url].
  static Future<Either<Error, EvolutionChain>> getEvolutionChain(EvolutionChainApiResource apiResource) => EvolutionChain.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of evolution triggers urls. Each evolution trigger can be fetched later by calling [getEvolutionTrigger(apiResource)].
  static Future<Either<Error, List<EvolutionTriggerApiResource>>> getEvolutionTriggerList({int? offSet = 0, int? limit = 100000}) => EvolutionTrigger.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a evolution trigger by its [url].
  static Future<Either<Error, EvolutionTrigger>> getEvolutionTrigger(EvolutionTriggerApiResource apiResource) => EvolutionTrigger.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  //#endregion

  //#region Games

  /// Fetches a list of generations urls. Each generation can be fetched later by calling [getGeneration(apiResource)].
  static Future<Either<Error, List<GenerationApiResource>>> getGenerationList({int? offSet = 0, int? limit = 100000}) => Generation.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a generation by its [url].
  static Future<Either<Error, Generation>> getGeneration(GenerationApiResource apiResource) => Generation.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of pokedexes urls. Each pokedex can be fetched later by calling [getPokedex(apiResource)].
  static Future<Either<Error, List<PokedexApiResource>>> getPokedexList({int? offSet = 0, int? limit = 100000}) => Pokedex.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a pokedex by its [url].
  static Future<Either<Error, Pokedex>> getPokedex(PokedexApiResource apiResource) => Pokedex.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of versions urls. Each version can be fetched later by calling [getVersion(apiResource)].
  static Future<Either<Error, List<VersionApiResource>>> getVersionList({int? offSet = 0, int? limit = 100000}) => Version.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a version by its [url].
  static Future<Either<Error, Version>> getVersion(VersionApiResource apiResource) => Version.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of version groups urls. Each version group can be fetched later by calling [getVersionGroup(apiResource)].
  static Future<Either<Error, List<VersionGroupApiResource>>> getVersionGroupList({int? offSet = 0, int? limit = 100000}) => VersionGroup.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a version group by its [url].
  static Future<Either<Error, VersionGroup>> getVersionGroup(VersionGroupApiResource apiResource) => VersionGroup.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  //#endregion

  //#region Items

  /// Fetches a list of item urls. Each item can be fetched later by calling [getItem(apiResource)].
  static Future<Either<Error, List<ItemApiResource>>> getItemList({int? offSet = 0, int? limit = 100000}) => Item.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a item by its [url].
  static Future<Either<Error, Item>> getItem(ItemApiResource apiResource) => Item.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of item attributes urls. Each item attribute can be fetched later by calling [getItemAttribute(apiResource)].
  static Future<Either<Error, List<ItemAttributeApiResource>>> getItemAttributeList({int? offSet = 0, int? limit = 100000}) => ItemAttribute.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a item attribute by its [url].
  static Future<Either<Error, ItemAttribute>> getItemAttribute(ItemAttributeApiResource apiResource) => ItemAttribute.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of item categories urls. Each item category can be fetched later by calling [getItemCategory(apiResource)].
  static Future<Either<Error, List<ItemCategoryApiResource>>> getItemCategoryList({int? offSet = 0, int? limit = 100000}) => ItemCategory.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a item category by its [url].
  static Future<Either<Error, ItemCategory>> getItemCategory(ItemCategoryApiResource apiResource) => ItemCategory.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of item fling effects urls. Each item fling effect can be fetched later by calling [getItemFlingEffect(apiResource)].
  static Future<Either<Error, List<ItemFlingEffectApiResource>>> getItemFlingEffectList({int? offSet = 0, int? limit = 100000}) => ItemFlingEffect.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a item fling effect by its [url].
  static Future<Either<Error, ItemFlingEffect>> getItemFlingEffect(ItemFlingEffectApiResource apiResource) => ItemFlingEffect.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of item pockets urls. Each item pocket can be fetched later by calling [getItemPocket(apiResource)].
  static Future<Either<Error, List<ItemPocketApiResource>>> getItemPocketList({int? offSet = 0, int? limit = 100000}) => ItemPocket.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a item pocket by its [url].
  static Future<Either<Error, ItemPocket>> getItemPocket(ItemPocketApiResource apiResource) => ItemPocket.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  //#endregion

  //#region Locations

  /// Fetches a list of locations urls. Each location can be fetched later by calling [getLocation(apiResource)].
  static Future<Either<Error, List<LocationApiResource>>> getLocationList({int? offSet = 0, int? limit = 100000}) => Location.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a location by its [url].
  static Future<Either<Error, Location>> getLocation(LocationApiResource apiResource) => Location.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of location areas urls. Each location area can be fetched later by calling [getLocationArea(apiResource)].
  static Future<Either<Error, List<LocationAreaApiResource>>> getLocationAreaList({int? offSet = 0, int? limit = 100000}) => LocationArea.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a location area by its [url].
  static Future<Either<Error, LocationArea>> getLocationArea(LocationAreaApiResource apiResource) => LocationArea.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of pal park areas urls. Each pal park area can be fetched later by calling [getPalParkArea(apiResource)].
  static Future<Either<Error, List<PalParkAreaApiResource>>> getPalParkAreaList({int? offSet = 0, int? limit = 100000}) => PalParkArea.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a pal park area by its [url].
  static Future<Either<Error, PalParkArea>> getPalParkArea(PalParkAreaApiResource apiResource) => PalParkArea.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of regions urls. Each region can be fetched later by calling [getRegion(apiResource)].
  static Future<Either<Error, List<RegionApiResource>>> getRegionList({int? offSet = 0, int? limit = 100000}) => Region.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a region by its [url].
  static Future<Either<Error, Region>> getRegion(RegionApiResource apiResource) => Region.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  //#endregion

  //#region Machines

  /// Fetches a list of machines urls. Each machine can be fetched later by calling [getMachine(apiResource)].
  static Future<Either<Error, List<MachineApiResource>>> getMachineList({int? offSet = 0, int? limit = 100000}) => Machine.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a machine by its [url].
  static Future<Either<Error, Machine>> getMachine(MachineApiResource apiResource) => Machine.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  //#endregion

  //#region Moves

  /// Fetches a list of moves urls. Each move can be fetched later by calling [getMove(apiResource)].
  static Future<Either<Error, List<MoveApiResource>>> getMoveList({int? offSet = 0, int? limit = 100000}) => Move.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a move by its [url].
  static Future<Either<Error, Move>> getMove(MoveApiResource apiResource) => Move.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of move ailments urls. Each move ailment can be fetched later by calling [getMoveAilment(apiResource)].
  static Future<Either<Error, List<MoveAilmentApiResource>>> getMoveAilmentList({int? offSet = 0, int? limit = 100000}) => MoveAilment.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a move ailment by its [url].
  static Future<Either<Error, MoveAilment>> getMoveAilment(MoveAilmentApiResource apiResource) => MoveAilment.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of move battle styles urls. Each move battle style can be fetched later by calling [getMoveBattleStyle(apiResource)].
  static Future<Either<Error, List<MoveBattleStyleApiResource>>> getMoveBattleStyleList({int? offSet = 0, int? limit = 100000}) => MoveBattleStyle.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a move battle style by its [url].
  static Future<Either<Error, MoveBattleStyle>> getMoveBattleStyle(MoveBattleStyleApiResource apiResource) => MoveBattleStyle.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of move categories urls. Each move category can be fetched later by calling [getMoveCategory(apiResource)].
  static Future<Either<Error, List<MoveCategoryApiResource>>> getMoveCategoryList({int? offSet = 0, int? limit = 100000}) => MoveCategory.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a move category by its [url].
  static Future<Either<Error, MoveCategory>> getMoveCategory(MoveCategoryApiResource apiResource) => MoveCategory.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of move damage classes urls. Each move damage class can be fetched later by calling [getMoveDamageClass(apiResource)].
  static Future<Either<Error, List<MoveDamageClassApiResource>>> getMoveDamageClassList({int? offSet = 0, int? limit = 100000}) => MoveDamageClass.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a move damage class by its [url].
  static Future<Either<Error, MoveDamageClass>> getMoveDamageClass(MoveDamageClassApiResource apiResource) => MoveDamageClass.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of move learn methods urls. Each move learn method can be fetched later by calling [getMoveLearnMethod(apiResource)].
  static Future<Either<Error, List<MoveLearnMethodApiResource>>> getMoveLearnMethodList({int? offSet = 0, int? limit = 100000}) => MoveLearnMethod.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a move learn method by its [url].
  static Future<Either<Error, MoveLearnMethod>> getMoveLearnMethod(MoveLearnMethodApiResource apiResource) => MoveLearnMethod.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of move targets urls. Each move target can be fetched later by calling [getMoveTarget(apiResource)].
  static Future<Either<Error, List<MoveTargetApiResource>>> getMoveTargetList({int? offSet = 0, int? limit = 100000}) => MoveTarget.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a move target by its [url].
  static Future<Either<Error, MoveTarget>> getMoveTarget(MoveTargetApiResource apiResource) => MoveTarget.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  //#endregion

  //#region Pokemon

  /// Fetches a list of abilities urls. Each ability can be fetched later by calling [getAbility(apiResource)].
  static Future<Either<Error, List<AbilityApiResource>>> getAbilityList({int? offSet = 0, int? limit = 100000}) => Ability.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a ability by its [url].
  static Future<Either<Error, Ability>> getAbility(AbilityApiResource apiResource) => Ability.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of characteristic urls. Each characteristic can be fetched later by calling [getCharacteristic(apiResource)].
  static Future<Either<Error, List<CharacteristicApiResource>>> getCharacteristicList({int? offSet = 0, int? limit = 100000}) => Characteristic.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a characteristic by its [url].
  static Future<Either<Error, Characteristic>> getCharacteristic(CharacteristicApiResource apiResource) => Characteristic.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of egg groups urls. Each egg group can be fetched later by calling [getEggGroup(apiResource)].
  static Future<Either<Error, List<EggGroupApiResource>>> getEggGroupList({int? offSet = 0, int? limit = 100000}) => EggGroup.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a egg group by its [url].
  static Future<Either<Error, EggGroup>> getEggGroup(EggGroupApiResource apiResource) => EggGroup.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of genders urls. Each gender can be fetched later by calling [getGender(apiResource)].
  static Future<Either<Error, List<GenderApiResource>>> getGenderList({int? offSet = 0, int? limit = 100000}) => Gender.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a gender by its [url].
  static Future<Either<Error, Gender>> getGender(GenderApiResource apiResource) => Gender.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of growth rates urls. Each growth rate can be fetched later by calling [getGrowthRate(apiResource)].
  static Future<Either<Error, List<GrowthRateApiResource>>> getGrowthRateList({int? offSet = 0, int? limit = 100000}) => GrowthRate.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a growth rate by its [url].
  static Future<Either<Error, GrowthRate>> getGrowthRate(GrowthRateApiResource apiResource) => GrowthRate.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of natures urls. Each nature can be fetched later by calling [getNature(apiResource)].
  static Future<Either<Error, List<NatureApiResource>>> getNatureList({int? offSet = 0, int? limit = 100000}) => Nature.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a nature by its [url].
  static Future<Either<Error, Nature>> getNature(NatureApiResource apiResource) => Nature.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of pokeathlon stats urls. Each pokeathlon stat can be fetched later by calling [getPokeathlonStat(apiResource)].
  static Future<Either<Error, List<PokeathlonStatApiResource>>> getPokeathlonStatList({int? offSet = 0, int? limit = 100000}) => PokeathlonStat.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a pokeathlon stat by its [url].
  static Future<Either<Error, PokeathlonStat>> getPokeathlonStat(PokeathlonStatApiResource apiResource) => PokeathlonStat.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of pokemon urls. Each pokemon can be fetched later by calling [getPokemon(apiResource)].
  static Future<Either<Error, List<PokemonApiResource>>> getPokemonList({int? offSet = 0, int? limit = 100000}) => Pokemon.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a pokemon by its [url].
  static Future<Either<Error, Pokemon>> getPokemon(PokemonApiResource apiResource) => Pokemon.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a location area encounter by its [url].
  static Future<Either<Error, LocationAreaEncounter>> getLocationAreaEncounter(LocationAreaEncounterApiResource apiResource) => LocationAreaEncounter.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of pokemon colors urls. Each pokemon color can be fetched later by calling [getPokemonColor(apiResource)].
  static Future<Either<Error, List<PokemonColorApiResource>>> getPokemonColorList({int? offSet = 0, int? limit = 100000}) => PokemonColor.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a pokemon color by its [url].
  static Future<Either<Error, PokemonColor>> getPokemonColor(PokemonColorApiResource apiResource) => PokemonColor.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of pokemon forms urls. Each pokemon form can be fetched later by calling [getPokemonForm(apiResource)].
  static Future<Either<Error, List<PokemonFormApiResource>>> getPokemonFormList({int? offSet = 0, int? limit = 100000}) => PokemonForm.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a pokemon form by its [url].
  static Future<Either<Error, PokemonForm>> getPokemonForm(PokemonFormApiResource apiResource) => PokemonForm.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of pokemon habitats urls. Each pokemon habitat can be fetched later by calling [getPokemonHabitat(apiResource)].
  static Future<Either<Error, List<PokemonHabitatApiResource>>> getPokemonHabitatList({int? offSet = 0, int? limit = 100000}) => PokemonHabitat.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a pokemon habitat by its [url].
  static Future<Either<Error, PokemonHabitat>> getPokemonHabitat(PokemonHabitatApiResource apiResource) => PokemonHabitat.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of pokemon shapes urls. Each pokemon shape can be fetched later by calling [getPokemonShape(apiResource)].
  static Future<Either<Error, List<PokemonShapeApiResource>>> getPokemonShapeList({int? offSet = 0, int? limit = 100000}) => PokemonShape.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a pokemon shape by its [url].
  static Future<Either<Error, PokemonShape>> getPokemonShape(PokemonShapeApiResource apiResource) => PokemonShape.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of pokemon species urls. Each pokemon species can be fetched later by calling [getPokemonSpecies(apiResource)].
  static Future<Either<Error, List<PokemonSpeciesApiResource>>> getPokemonSpeciesList({int? offSet = 0, int? limit = 100000}) => PokemonSpecies.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a pokemon species by its [url].
  static Future<Either<Error, PokemonSpecies>> getPokemonSpecies(PokemonSpeciesApiResource apiResource) => PokemonSpecies.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of stats urls. Each stat can be fetched later by calling [getStat(apiResource)].
  static Future<Either<Error, List<StatApiResource>>> getStatList({int? offSet = 0, int? limit = 100000}) => Stat.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a stat by its [url].
  static Future<Either<Error, Stat>> getStat(StatApiResource apiResource) => Stat.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  /// Fetches a list of types urls. Each type can be fetched later by calling [getType(apiResource)].
  static Future<Either<Error, List<TypeApiResource>>> getTypeList({int? offSet = 0, int? limit = 100000}) => Type.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a type by its [url].
  static Future<Either<Error, Type>> getType(TypeApiResource apiResource) => Type.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

  //#endregion

  //#region Utility

  /// Fetches a list of languages urls. Each language can be fetched later by calling [getLanguage(apiResource)].
  static Future<Either<Error, List<LanguageApiResource>>> getLanguageList({int? offSet = 0, int? limit = 100000}) => Language.adapter.fetchApiResourceList(service: _service, offSet: offSet, limit: limit);

  /// Fetches a language by its [url].
  static Future<Either<Error, Language>> getLanguage(LanguageApiResource apiResource) => Language.adapter.fetchModelFromApiResource(service: _service, apiResource: apiResource);

//#endregion
}

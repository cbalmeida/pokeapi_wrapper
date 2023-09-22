import '../../pokeapi_wrapper.dart';

extension BerryApiResourceExtension on BerryApiResource {
  Future<Either<Error, Berry>> getBerry() => PokeApi.getBerry(this);
}

extension BerryFirmnessApiResourceExtension on BerryFirmnessApiResource {
  Future<Either<Error, BerryFirmness>> getBerryFirmness() => PokeApi.getBerryFirmness(this);
}

extension BerryFlavorApiResourceExtension on BerryFlavorApiResource {
  Future<Either<Error, BerryFlavor>> getBerryFlavor() => PokeApi.getBerryFlavor(this);
}

extension ContestTypeApiResourceExtension on ContestTypeApiResource {
  Future<Either<Error, ContestType>> getContestType() => PokeApi.getContestType(this);
}

extension ContestEffectApiResourceExtension on ContestEffectApiResource {
  Future<Either<Error, ContestEffect>> getContestEffect() => PokeApi.getContestEffect(this);
}

extension SuperContestEffectApiResourceExtension on SuperContestEffectApiResource {
  Future<Either<Error, SuperContestEffect>> getSuperContestEffect() => PokeApi.getSuperContestEffect(this);
}

extension EncounterMethodApiResourceExtension on EncounterMethodApiResource {
  Future<Either<Error, EncounterMethod>> getEncounterMethod() => PokeApi.getEncounterMethod(this);
}

extension EncounterConditionApiResourceExtension on EncounterConditionApiResource {
  Future<Either<Error, EncounterCondition>> getEncounterCondition() => PokeApi.getEncounterCondition(this);
}

extension EncounterConditionValueApiResourceExtension on EncounterConditionValueApiResource {
  Future<Either<Error, EncounterConditionValue>> getEncounterConditionValue() => PokeApi.getEncounterConditionValue(this);
}

extension EvolutionChainApiResourceExtension on EvolutionChainApiResource {
  Future<Either<Error, EvolutionChain>> getEvolutionChain() => PokeApi.getEvolutionChain(this);
}

extension EvolutionTriggerApiResourceExtension on EvolutionTriggerApiResource {
  Future<Either<Error, EvolutionTrigger>> getEvolutionTrigger() => PokeApi.getEvolutionTrigger(this);
}

extension GenerationApiResourceExtension on GenerationApiResource {
  Future<Either<Error, Generation>> getGeneration() => PokeApi.getGeneration(this);
}

extension PokedexApiResourceExtension on PokedexApiResource {
  Future<Either<Error, Pokedex>> getPokedex() => PokeApi.getPokedex(this);
}

extension VersionApiResourceExtension on VersionApiResource {
  Future<Either<Error, Version>> getVersion() => PokeApi.getVersion(this);
}

extension VersionGroupApiResourceExtension on VersionGroupApiResource {
  Future<Either<Error, VersionGroup>> getVersionGroup() => PokeApi.getVersionGroup(this);
}

extension ItemApiResourceExtension on ItemApiResource {
  Future<Either<Error, Item>> getItem() => PokeApi.getItem(this);
}

extension ItemAttributeApiResourceExtension on ItemAttributeApiResource {
  Future<Either<Error, ItemAttribute>> getItemAttribute() => PokeApi.getItemAttribute(this);
}

extension ItemCategoryApiResourceExtension on ItemCategoryApiResource {
  Future<Either<Error, ItemCategory>> getItemCategory() => PokeApi.getItemCategory(this);
}

extension ItemFlingEffectApiResourceExtension on ItemFlingEffectApiResource {
  Future<Either<Error, ItemFlingEffect>> getItemFlingEffect() => PokeApi.getItemFlingEffect(this);
}

extension ItemPocketApiResourceExtension on ItemPocketApiResource {
  Future<Either<Error, ItemPocket>> getItemPocket() => PokeApi.getItemPocket(this);
}

extension LocationApiResourceExtension on LocationApiResource {
  Future<Either<Error, Location>> getLocation() => PokeApi.getLocation(this);
}

extension LocationAreaApiResourceExtension on LocationAreaApiResource {
  Future<Either<Error, LocationArea>> getLocationArea() => PokeApi.getLocationArea(this);
}

extension PalParkAreaApiResourceExtension on PalParkAreaApiResource {
  Future<Either<Error, PalParkArea>> getPalParkArea() => PokeApi.getPalParkArea(this);
}

extension RegionApiResourceExtension on RegionApiResource {
  Future<Either<Error, Region>> getRegion() => PokeApi.getRegion(this);
}

extension MachineApiResourceExtension on MachineApiResource {
  Future<Either<Error, Machine>> getMachine() => PokeApi.getMachine(this);
}

extension MoveApiResourceExtension on MoveApiResource {
  Future<Either<Error, Move>> getMove() => PokeApi.getMove(this);
}

extension MoveAilmentApiResourceExtension on MoveAilmentApiResource {
  Future<Either<Error, MoveAilment>> getMoveAilment() => PokeApi.getMoveAilment(this);
}

extension MoveBattleStyleApiResourceExtension on MoveBattleStyleApiResource {
  Future<Either<Error, MoveBattleStyle>> getMoveBattleStyle() => PokeApi.getMoveBattleStyle(this);
}

extension MoveCategoryApiResourceExtension on MoveCategoryApiResource {
  Future<Either<Error, MoveCategory>> getMoveCategory() => PokeApi.getMoveCategory(this);
}

extension MoveDamageClassApiResourceExtension on MoveDamageClassApiResource {
  Future<Either<Error, MoveDamageClass>> getMoveDamageClass() => PokeApi.getMoveDamageClass(this);
}

extension MoveLearnMethodApiResourceExtension on MoveLearnMethodApiResource {
  Future<Either<Error, MoveLearnMethod>> getMoveLearnMethod() => PokeApi.getMoveLearnMethod(this);
}

extension MoveTargetApiResourceExtension on MoveTargetApiResource {
  Future<Either<Error, MoveTarget>> getMoveTarget() => PokeApi.getMoveTarget(this);
}

extension AbilityApiResourceExtension on AbilityApiResource {
  Future<Either<Error, Ability>> getAbility() => PokeApi.getAbility(this);
}

extension CharacteristicApiResourceExtension on CharacteristicApiResource {
  Future<Either<Error, Characteristic>> getCharacteristic() => PokeApi.getCharacteristic(this);
}

extension EggGroupApiResourceExtension on EggGroupApiResource {
  Future<Either<Error, EggGroup>> getEggGroup() => PokeApi.getEggGroup(this);
}

extension GenderApiResourceExtension on GenderApiResource {
  Future<Either<Error, Gender>> getGender() => PokeApi.getGender(this);
}

extension GrowthRateApiResourceExtension on GrowthRateApiResource {
  Future<Either<Error, GrowthRate>> getGrowthRate() => PokeApi.getGrowthRate(this);
}

extension NatureApiResourceExtension on NatureApiResource {
  Future<Either<Error, Nature>> getNature() => PokeApi.getNature(this);
}

extension PokeathlonStatApiResourceExtension on PokeathlonStatApiResource {
  Future<Either<Error, PokeathlonStat>> getPokeathlonStat() => PokeApi.getPokeathlonStat(this);
}

extension PokemonApiResourceExtension on PokemonApiResource {
  Future<Either<Error, Pokemon>> getPokemon() => PokeApi.getPokemon(this);
}

extension LocationAreaEncounterApiResourceExtension on LocationAreaEncounterApiResource {
  Future<Either<Error, LocationAreaEncounter>> getLocationAreaEncounter() => PokeApi.getLocationAreaEncounter(this);
}

extension PokemonColorApiResourceExtension on PokemonColorApiResource {
  Future<Either<Error, PokemonColor>> getPokemonColor() => PokeApi.getPokemonColor(this);
}

extension PokemonFormApiResourceExtension on PokemonFormApiResource {
  Future<Either<Error, PokemonForm>> getPokemonForm() => PokeApi.getPokemonForm(this);
}

extension PokemonHabitatApiResourceExtension on PokemonHabitatApiResource {
  Future<Either<Error, PokemonHabitat>> getPokemonHabitat() => PokeApi.getPokemonHabitat(this);
}

extension PokemonShapeApiResourceExtension on PokemonShapeApiResource {
  Future<Either<Error, PokemonShape>> getPokemonShape() => PokeApi.getPokemonShape(this);
}

extension PokemonSpeciesApiResourceExtension on PokemonSpeciesApiResource {
  Future<Either<Error, PokemonSpecies>> getPokemonSpecies() => PokeApi.getPokemonSpecies(this);
}

extension StatApiResourceExtension on StatApiResource {
  Future<Either<Error, Stat>> getStat() => PokeApi.getStat(this);
}

extension TypeApiResourceExtension on TypeApiResource {
  Future<Either<Error, Type>> getType() => PokeApi.getType(this);
}

extension LanguageApiResourceExtension on LanguageApiResource {
  Future<Either<Error, Language>> getLanguage() => PokeApi.getLanguage(this);
}

import 'package:flutter/material.dart';

import '../api_models.dart';
import '../core.dart';
import '../models.dart';
import '../services.dart';

class PokemonColor extends Model<PokemonColorApiModel> {
  static var adapter = PokemonColorAdapter();

  const PokemonColor({required super.service, required super.apiModel});

  /// The identifier for this Pokémon color resource
  int get id => apiModel.id;

  /// The name for this Pokémon color resource
  String get name => apiModel.name;

  /// The name of this resource listed in different languages.
  List<Name> get names => Name.adapter.createModelListFromApiModelList(service: service, apiModelList: apiModel.names);

  /// A list of the Pokémon species that have this color.
  Future<Either<Error, List<PokemonSpecies>>> get pokemonSpecies => PokemonSpecies.adapter.fetchModelListFromApiResourceList(service: service, apiResourceList: apiModel.pokemonSpecies);

  Color? get color {
    switch (name) {
      case 'black':
        return Colors.black;
      case 'blue':
        return Colors.blue;
      case 'brown':
        return Colors.brown;
      case 'gray':
        return Colors.grey;
      case 'green':
        return Colors.green;
      case 'pink':
        return Colors.pink;
      case 'purple':
        return Colors.purple;
      case 'red':
        return Colors.red;
      case 'white':
        return Colors.white;
      case 'yellow':
        return Colors.yellow;
      default:
        return null;
    }
  }
}

class PokemonColorAdapter extends ApiResourceAdapter<PokemonColorApiModel, PokemonColor, PokemonColorApiResource> {
  @override
  Future<Either<Error, PokemonColorApiModel>> fetchApiModel({required IService service, required ApiResource apiResource}) async {
    return service.getPokemonColor(apiResource.url);
  }

  @override
  PokemonColor createModelFromApiModel({required IService service, required PokemonColorApiModel apiModel}) {
    return PokemonColor(service: service, apiModel: apiModel);
  }

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/pokemon-color';

  @override
  Future<Either<Error, List<PokemonColorApiResource>>> fetchApiResourceList({required IService service, int? offSet = 0, int? limit = 100000}) {
    return service.getPokemonColorList(offSet: offSet, limit: limit);
  }
}

class PokemonColorApiResource extends ApiResource {
  const PokemonColorApiResource({required super.url});

  static get mapper => PokemonColorApiResourceMapper();
}

class PokemonColorApiResourceMapper extends ApiResourceMapper<PokemonColorApiResource> {
  @override
  PokemonColorApiResource fromUrl(String url) {
    return PokemonColorApiResource(url: url);
  }
}

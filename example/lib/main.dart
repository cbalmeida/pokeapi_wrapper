import 'package:flutter/material.dart';
import 'package:pokeapi_wrapper/pokeapi_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PokeApi Demo',
      debugShowCheckedModeBanner: false,
      home: PokeApiDemoExample(),
    );
  }
}

class PokeApiDemoExample extends StatelessWidget {
  const PokeApiDemoExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PokeApi Demo")),
      body: const PokeApiDemoExampleBody(),
    );
  }
}

class PokeApiDemoExampleBody extends FutureBuilderWidget<List<PokemonApiResource>> {
  const PokeApiDemoExampleBody({super.key});

  @override
  Future<Either<Error, List<PokemonApiResource>>> get future => PokeApi.getPokemonList();

  @override
  Widget onWaiting(BuildContext context) => const Center(child: CircularProgressIndicator());

  @override
  Widget onError(BuildContext context, Error error) => Text("Error: ${error.toString()}");

  @override
  Widget onSuccess(BuildContext context, List<PokemonApiResource> value) => ListView.builder(
        itemExtent: 100.0, // it is very important to set itemExtent in ListView.builder in order of itemBuilder to be called only for visible items
        itemCount: value.length,
        itemBuilder: (context, index) => PokeApiDemoExamplePokemon(pokemonApiResource: value[index]),
      );
}

class PokeApiDemoExamplePokemon extends FutureBuilderWidget<Pokemon> {
  final PokemonApiResource pokemonApiResource;
  const PokeApiDemoExamplePokemon({super.key, required this.pokemonApiResource});

  @override
  Future<Either<Error, Pokemon>> get future => PokeApi.getPokemon(pokemonApiResource);

  @override
  Widget onWaiting(BuildContext context) => const ListTile(leading: CircularProgressIndicator());

  @override
  Widget onError(BuildContext context, Error error) => ListTile(leading: const Icon(Icons.error), title: const Text("Error", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), subtitle: Text(error.toString()));

  @override
  Widget onSuccess(BuildContext context, Pokemon value) => PokeApiDemoExamplePokemonSpecies(pokemon: value);
}

class PokeApiDemoExamplePokemonSpecies extends FutureBuilderWidget<PokemonSpecies> {
  final Pokemon pokemon;
  const PokeApiDemoExamplePokemonSpecies({super.key, required this.pokemon});

  @override
  Future<Either<Error, PokemonSpecies>> get future => pokemon.species;

  @override
  Widget onWaiting(BuildContext context) => Container(color: Colors.white);

  @override
  Widget onError(BuildContext context, Error error) => Container(color: Colors.white);

  @override
  Widget onSuccess(BuildContext context, PokemonSpecies value) => PokeApiDemoExamplePokemonColor(pokemon: pokemon, pokemonSpecies: value);
}

class PokeApiDemoExamplePokemonColor extends FutureBuilderWidget<PokemonColor> {
  final Pokemon pokemon;
  final PokemonSpecies pokemonSpecies;
  const PokeApiDemoExamplePokemonColor({super.key, required this.pokemon, required this.pokemonSpecies});

  @override
  Future<Either<Error, PokemonColor>> get future => pokemonSpecies.color;

  @override
  Widget onWaiting(BuildContext context) => Container(color: Colors.white);

  @override
  Widget onError(BuildContext context, Error error) => Container(color: Colors.red, child: Text(error.toString()));

  @override
  Widget onSuccess(BuildContext context, PokemonColor value) => Card(
        color: value.color?.withAlpha(200),
        child: ListTile(
          leading: Image.network(pokemon.sprites.officialArtWork),
          title: Text(pokemon.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          subtitle: Wrap(spacing: 4, runSpacing: 4, children: pokemon.types.map((pokemonType) => PokeApiDemoExampleAbilityChip(pokemonType: pokemonType)).toList()),
        ),
      );
}

class PokeApiDemoExampleAbilityChip extends FutureBuilderWidget<Type> {
  final PokemonType pokemonType;
  const PokeApiDemoExampleAbilityChip({super.key, required this.pokemonType});

  @override
  Future<Either<Error, Type>> get future => pokemonType.type;

  @override
  Widget onWaiting(BuildContext context) => const Chip(label: CircularProgressIndicator());

  @override
  Widget onError(BuildContext context, Error error) => Chip(label: Text("Error: ${error.toString()}"));

  @override
  Widget onSuccess(BuildContext context, Type value) => Chip(label: Text(value.name));
}

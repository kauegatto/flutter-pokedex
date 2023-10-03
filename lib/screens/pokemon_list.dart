import 'package:flutter/material.dart';

import '../model/pokemon_model.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // fetch data from pokemonModel
    final List<PokemonModel> pokemonList = PokemonModel.getPokemon();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          return ListTile(
            leading: Image.asset(
              pokemon.image,
              width: 50,
              height: 50,
            ),
            title: Text(pokemon.name),
            subtitle: Text('Tipo: ${pokemon.type}'),
            onTap: () {
              // Handle Pokémon selection
              _showPokemonDetails(context, pokemon);
            },
          );
        },
      ),
    );
  }

  void _showPokemonDetails(BuildContext context, PokemonModel pokemon) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pokemon.name),
          content: SingleChildScrollView(
            // Vamos comocar o filho como column e permitir que ele seja scrollado
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Usar mainAxisSize.min pra nao ocupar espaço desnecessario, o mesmo que em home
              children: [
                Image.asset(
                  pokemon.image,
                  width: 150,
                  height: 150,
                ),
                Text('Número na pokedex: #${pokemon.number}'),
                Text('Tipo: ${pokemon.type}'),
                if (pokemon.curiosities != null)
                  Text('Curiosidade: ${pokemon.curiosities}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}

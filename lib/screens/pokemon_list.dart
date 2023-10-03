import 'package:flutter/material.dart';

import '../model/pokemon_model.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({Key? key}) : super(key: key);

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final List<PokemonModel> pokemonList = PokemonModel.getPokemon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            trailing: IconButton(
              icon: Icon(
                pokemon.liked ? Icons.favorite : Icons.favorite_border,
                color: pokemon.liked ? Colors.red : null,
              ),
              onPressed: () {
                _toggleLike(pokemon, context);
              },
            ),
            onTap: () {
              _showPokemonDetails(context, pokemon);
            },
            tileColor: index % 2 == 0
                ? const Color.fromARGB(183, 44, 40, 40)
                : Color.fromARGB(255, 133, 20, 27),
          );
        },
      ),
    );
  }

  void _toggleLike(PokemonModel pokemon, BuildContext context) {
    setState(() {
      pokemon.liked = !pokemon.liked;
    });
    _showLikeSnackBar(context, pokemon);
  }

  void _showLikeSnackBar(BuildContext context, PokemonModel pokemon) {
    final snackBar = SnackBar(
      content: Text(pokemon.liked
          ? 'Curtiu ${pokemon.name} ❤️'
          : 'Descurtiu ${pokemon.name} 😭'),
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: () {
          _toggleLike(pokemon, context);
        },
      ),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              child: const Text('Fechar',
                  style: TextStyle(color: Colors.redAccent)),
            ),
          ],
        );
      },
    );
  }
}

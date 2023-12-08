import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/like/like_bloc.dart';
import '../logic/like/like_event.dart';
import '../logic/like/like_state.dart';
import '../model/pokemon_model.dart';

class PokemonListItem extends StatelessWidget {
  final PokemonModel pokemon;
  final LikeState likeState;
  final Color tileColor;

  const PokemonListItem(
      {super.key,
      required this.pokemon,
      required this.likeState,
      this.tileColor = Colors.red});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        pokemon.image,
        width: 50,
        height: 50,
      ),
      title: Text(pokemon.name),
      subtitle: Text('Tipo: ${pokemon.type}'),
      trailing: IconButton(
        icon: Icon(
          likeState.isLiked(pokemon.number)
              ? Icons.favorite
              : Icons.favorite_border,
          color: pokemon.liked ? Colors.red : null,
        ),
        onPressed: () {
          _toggleLike(pokemon, context);
        },
      ),
      onTap: () {
        _showPokemonDetails(context, pokemon);
      },
      tileColor: tileColor,
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
                Image.network(
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

void _toggleLike(PokemonModel pokemon, BuildContext context) {
  final likeBloc = BlocProvider.of<LikeBloc>(context);
  final bool isLiked = likeBloc.state.isLiked(pokemon.number);
  likeBloc.add(LikeEvent(pokemon.number, !isLiked));
  _showLikeSnackBar(context, pokemon, isLiked);
}

void _showLikeSnackBar(
    BuildContext context, PokemonModel pokemon, bool isLiked) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 1),
    content: Text(!isLiked
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

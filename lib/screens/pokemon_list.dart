import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/like/like_bloc.dart';
import '../logic/like/like_state.dart';
import '../logic/login/login_bloc.dart';
import '../logic/login/login_state.dart';
import '../model/pokemon_model.dart';
import '../widgets/pokemon_list_item.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, loginState) {
        return FutureBuilder<List<PokemonModel>>(
          future: PokemonModel.getPokemonList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final pokemonList = snapshot.data;
              return ListView.builder(
                itemCount: pokemonList!.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemonList[index];
                  return BlocBuilder<LikeBloc, LikeState>(
                    builder: (context, likeState) {
                      return PokemonListItem(
                        pokemon: pokemon,
                        likeState: likeState,
                        tileColor: index % 2 == 0
                            ? const Color.fromARGB(183, 44, 40, 40)
                            : const Color.fromARGB(255, 133, 20, 27),
                      );
                    },
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}

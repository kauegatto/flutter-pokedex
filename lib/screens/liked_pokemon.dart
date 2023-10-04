import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dex/model/pokemon_model.dart';

import '../logic/like/like_bloc.dart';
import '../logic/like/like_event.dart';
import '../logic/like/like_state.dart';
import '../logic/login/login_bloc.dart';
import '../logic/login/login_state.dart';
import '../widgets/pokemon_list_item.dart';

class LikedPokemonScreen extends StatefulWidget {
  const LikedPokemonScreen({Key? key}) : super(key: key);

  @override
  LikedPokemonScreenState createState() => LikedPokemonScreenState();
}

class LikedPokemonScreenState extends State<LikedPokemonScreen> {
  late Future<List<PokemonModel>> _likedPokemonFuture;

  @override
  void initState() {
    super.initState();
    final email = (BlocProvider.of<LoginBloc>(context).state is LoggedIn)
        ? (BlocProvider.of<LoginBloc>(context).state as LoggedIn).email
        : null;
    final likeBloc = BlocProvider.of<LikeBloc>(context);

    // Dispatch the FindLikedEvent to fetch liked Pokémon
    likeBloc.add(FindLikedEvent(email));
    _likedPokemonFuture =
        PokemonModel.getPokemonByNumbers(likeBloc.state.pokemonLikes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LikeBloc, LikeState>(
        builder: (context, likeState) {
          return FutureBuilder<List<PokemonModel>>(
            future: _likedPokemonFuture, // Use the stored future
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final likedPokemon = snapshot.data;
                // Build your screen based on the fetched liked Pokémon data
                if (likedPokemon!.isEmpty) {
                  return const Center(
                    child: Text(
                      "Você ainda não curtiu nenhum Pokémon!",
                      maxLines: 1,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: likedPokemon.length,
                  itemBuilder: (context, index) {
                    final pokemon = likedPokemon[index];
                    return PokemonListItem(
                      pokemon: pokemon,
                      likeState: likeState,
                      tileColor: index % 2 == 0
                          ? const Color.fromARGB(183, 44, 40, 40)
                          : const Color.fromARGB(255, 133, 20, 27),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}

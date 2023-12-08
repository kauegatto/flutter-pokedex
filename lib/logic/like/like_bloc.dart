import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dex/provider/firebase_firestore.dart';

import '../../model/user_model.dart';
import 'like_event.dart';
import 'like_state.dart';

class LikeBloc extends Bloc<AbstractLikeEvent, LikeState> {
  final String? uuid;
  UserModel? currentUser;
  List<int>? likedPokemons;

  LikeBloc({required this.uuid}) : super(LikeState()) {
    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: true);

    on<FindLikedEvent>((event, emit) async {
      try {
        likedPokemons = await fetchLikedPokemonsFromFirestore(uuid);
        emit(LikeState(pokemonLikes: likedPokemons));
      } catch (error) {
        // Handle errors, such as logging or displaying an error message
        print('Error fetching liked Pokémon: $error');
      }
    });

    on<LikeEvent>((event, emit) async {
      if (event.isLiked) {
        likedPokemons?.add(event.number);
      } else {
        likedPokemons?.remove(event.number);
      }

      await FirestoreDatabase.conn.addPokemon(likedPokemons);
      likedPokemons = await fetchLikedPokemonsFromFirestore(uuid);
        emit(LikeState(pokemonLikes: likedPokemons));
    });
  }

  Future<List<int>> fetchLikedPokemonsFromFirestore(String? uuid) async {
    if (uuid == null) {
      return [];
    }

    try {
      final documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uuid).get();

      if (documentSnapshot.exists) {
        final userData = documentSnapshot.data();
        final likedPokemons = userData?['pokemons'] as List<dynamic>?;

        if (likedPokemons != null) {
          return likedPokemons.map((item) {
            if (item is int) {
              return item;
            } else if (item is String) {
              return int.tryParse(item) ??
                  0; // Substitua 0 por um valor adequado ou tratamento de erro.
            } else {
              // Tratamento para tipos inesperados.
              print(
                  "Tipo inesperado encontrado na lista de Pokémons curtidos: ${item.runtimeType}");
              return 0; // Substitua 0 por um valor adequado ou tratamento de erro.
            }
          }).toList();
        }
      }
    } catch (error) {
      print('Erro ao buscar Pokémons curtidos no Firestore: $error');
    }

    return [];
  }

}

import 'package:firebase_auth/firebase_auth.dart';

import '../model/pokemon_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  
  static FirestoreDatabase conn = FirestoreDatabase._createInstance();

  FirestoreDatabase._createInstance();

  String? uid;

  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;

      return users.doc(uid).set({
        'email': user.email,
        'pokemons': []
      })
      .then((value) => print("usuário adicionado com sucesso"))
      .catchError((error) => print("erro ao adicionar usuário: $error"));
    } else {
      print("Usuário não encontrado");
    }
  }

  CollectionReference userPokemons(String userId) {
    return users.doc(userId).collection('pokemons');
  }

  Future<void> addPokemon(List<int>? pokemonNumber) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
      
      return users.doc(uid).set({
        'pokemons': pokemonNumber
      })
      .then((value) => print("Pokémon adicionado com sucesso"))
      .catchError((error) => print("Erro ao adicionar Pokémon: $error"));
    } else {
      print("Usuário não encontrado");
    }
  }
}
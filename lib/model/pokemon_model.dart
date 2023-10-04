import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PokemonModel {
  final int number;
  final String name;
  final String image;
  final String type;
  final String? curiosities;
  bool liked;

  PokemonModel(
      {required this.number,
      required this.name,
      required this.image,
      required this.type,
      this.curiosities,
      this.liked = false});

  static Future<List<PokemonModel>> getPokemonList() async {
    final List<PokemonModel> pokemonList = [];

    for (int i = 1; i <= 15; i++) {
      // 1st gen is the best
      final Response response =
          await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$i'));

      if (response.statusCode == 200) {
        pokemonList.add(PokemonModel.fromJson(jsonDecode(response.body)));
      } else {
        throw Exception('Failed to load Pokémon data for ID: $i');
      }
    }

    return pokemonList;
  }

  static Future<List<PokemonModel>> getPokemonByNumbers(Set<int> ids) async {
    final List<PokemonModel> pokemonList = [];

    for (var pokemonId in ids) {
      final Response response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId'));

      if (response.statusCode == 200) {
        pokemonList.add(PokemonModel.fromJson(jsonDecode(response.body)));
      } else {
        throw Exception('Failed to load Pokémon data for ID: $pokemonId');
      }
    }
    return pokemonList;
  }

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final String imageUrl =
        json['sprites']['other']['official-artwork']['front_default'];

    final List<dynamic> types = json['types'];
    String typeList = "";

    for (var typeEntry in types) {
      if (typeList.isEmpty) {
        // ignore: prefer_interpolation_to_compose_strings
        typeList = typeEntry['type']['name'];
      } else {
        typeList = "$typeList/" + typeEntry['type']['name'];
      }
    }

    return PokemonModel(
        number: json['id'],
        name: json['name'],
        type: typeList,
        image: imageUrl);
  }
}

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

  static List<PokemonModel> getPokemon() {
    return List<PokemonModel>.of([
      PokemonModel(
        number: 025,
        name: 'Pikachu',
        image: 'assets/images/pikachu.png',
        type: 'Electric',
        curiosities: 'O pikachu do ash ama ketchup',
      ),
      PokemonModel(
        number: 1,
        name: 'Bulbasaur',
        image: 'assets/images/bulbasaur.png',
        type: 'Grass/Poison',
      ),
      PokemonModel(
          number: 906,
          name: 'Sprigatito',
          image: 'assets/images/sprigatito.png',
          type: 'Grass',
          curiosities: "Pokémon preferido do aluno Gustavo Beck 🍁"),
      PokemonModel(
        number: 6,
        name: 'Charizard',
        image: 'assets/images/charizard.png',
        type: 'Fire/Flying',
      ),
    ]);
  }

  static List<PokemonModel> getPokemonByNumbers(Set<int> id) {
    return getPokemon()
        .where((pokemon) => id.contains(pokemon.number))
        .toList();
  }
}

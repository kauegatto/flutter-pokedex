class UserModel {
  String? uuid;
  String? email;
  String gender = "Masculino";
  DateTime? birthDate;

  final List<int> _pokemons; // vem do firebase - lista de integers


  factory UserModel.fromFirestore(Map<String, dynamic>? data) {
    if (data == null) {
      // Handle the case where data is null (optional)
      throw FormatException("Invalid data: null");
    }

    return UserModel(
      email: data['email'] as String?,
      pokemons: List<int>.from(data['pokemons'] as List<int> ?? []),
    );
  }


  UserModel({
    this.uuid,
    this.email,
    List<int>? pokemons,
  }) : _pokemons = pokemons ?? [];

  bool isLiked(int pokemonNumber) {
    return _pokemons.contains(pokemonNumber);
  }

  void addLike(int pokemonNumber) {
    print("entrou na adição de model do pokémon");
    _pokemons.add(pokemonNumber); // atualiza do firebase
  }

  void removeLike(int pokemonNumber) {
    print("entrou na remoção model do pokémon");
    _pokemons.remove(pokemonNumber); // atualiza do frebase
  }

  List<int> getLikedPokemons() {
    return List.from(_pokemons);
  }
}

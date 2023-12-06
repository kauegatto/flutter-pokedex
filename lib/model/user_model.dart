class UserModel {
  final String uuid;
  String gender = "Masculino";
  DateTime? birthDate;

  final Set<int> _likedPokemons; // vem do firebase - lista de integers

  UserModel({
    required this.uuid,
    Set<int>? getLikedPokemons,
  }) : _likedPokemons = getLikedPokemons ?? {};

  bool isLiked(int pokemonNumber) {
    return _likedPokemons.contains(pokemonNumber);
  }

  void addLike(int pokemonNumber) {
    _likedPokemons.add(pokemonNumber); // atualiza do firebase
  }

  void removeLike(int pokemonNumber) {
    _likedPokemons.remove(pokemonNumber); // atualiza do frebase
  }

  Set<int> getLikedPokemons() {
    return Set.from(_likedPokemons);
  }
}

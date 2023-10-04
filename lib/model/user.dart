class User {
  final String email;
  final String password;
  String gender = "Masculino";
  DateTime? birthDate;

  final Set<int> _likedPokemons;

  User({
    required this.email,
    required this.password,
    Set<int>? likedPokemons,
  }) : _likedPokemons = likedPokemons ?? {};

  bool isLiked(int pokemonNumber) {
    return _likedPokemons.contains(pokemonNumber);
  }

  void addLike(int pokemonNumber) {
    _likedPokemons.add(pokemonNumber);
  }

  void removeLike(int pokemonNumber) {
    _likedPokemons.remove(pokemonNumber);
  }

  Set<int> likedPokemons() {
    return Set.from(
        _likedPokemons); // encapsulating, creating a clone list which can't be accessed directly
  }
}

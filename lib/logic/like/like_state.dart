enum LikeStatus { loading, liked, unliked }

class LikeState {
  final List<int> pokemonLikes;

  LikeState({List<int>? pokemonLikes}) : pokemonLikes = pokemonLikes ?? [];

  bool isLiked(int pokemonIndex) {
    return pokemonLikes.contains(pokemonIndex);
  }
}

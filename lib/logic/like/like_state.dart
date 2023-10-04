enum LikeStatus { liked, unliked }

class LikeState {
  final Set<int> pokemonLikes;

  LikeState({Set<int>? pokemonLikes}) : pokemonLikes = pokemonLikes ?? {};

  bool isLiked(int pokemonIndex) {
    return pokemonLikes.contains(pokemonIndex);
  }
}

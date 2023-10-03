enum LikeStatus { liked, unliked }

class LikeState {
  final Map<int, LikeStatus> pokemonLikes;

  LikeState({Map<int, LikeStatus>? pokemonLikes})
      : pokemonLikes = pokemonLikes ?? {};

  bool isLiked(int pokemonIndex) {
    return pokemonLikes.containsKey(pokemonIndex) &&
        pokemonLikes[pokemonIndex] == LikeStatus.liked;
  }
}

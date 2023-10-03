import 'package:flutter_bloc/flutter_bloc.dart';

class LikeEvent {
  final int number; // Pokemon number or ID

  LikeEvent(this.number);
}

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

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeState()) {
    on<LikeEvent>((event, emit) {
      final updatedLikes = Map<int, LikeStatus>.from(state.pokemonLikes);

      // Toggle liked/unliked status for the specified Pokemon index
      final pokemonIndex = event.number;
      if (updatedLikes.containsKey(pokemonIndex)) {
        updatedLikes[pokemonIndex] =
            updatedLikes[pokemonIndex] == LikeStatus.liked
                ? LikeStatus.unliked
                : LikeStatus.liked;
      } else {
        updatedLikes[pokemonIndex] = LikeStatus.liked;
      }

      emit(LikeState(pokemonLikes: updatedLikes));
    });
  }
}

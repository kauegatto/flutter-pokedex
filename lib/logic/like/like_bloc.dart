import 'package:flutter_bloc/flutter_bloc.dart';

import 'like_event.dart';
import 'like_state.dart';

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

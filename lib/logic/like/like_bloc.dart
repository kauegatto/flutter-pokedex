import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user_model.dart';
import 'like_event.dart';
import 'like_state.dart';

class LikeBloc extends Bloc<AbstractLikeEvent, LikeState> {
  final String? userEmail;
  UserModel temporaryMockUser = UserModel(uuid: "TESTE");

  LikeBloc({required this.userEmail}) : super(LikeState()) {
    on<LikeEvent>((event, emit) {
      if (userEmail == null) {
        return;
      }
      final pokemonNumber = event.number;

      // userRepository.getUser (mocked for now)

      if (!temporaryMockUser.isLiked(event.number)) {
        temporaryMockUser.addLike(pokemonNumber);
      } else {
        temporaryMockUser.removeLike(pokemonNumber);
      }
      print("Liked now: ${temporaryMockUser.likedPokemons()}");
      emit(LikeState(pokemonLikes: temporaryMockUser.likedPokemons()));
    });
    on<FindLikedEvent>((event, emit) {
      if (userEmail == null) {
        return;
      }

      // userRepository.getUser (mocked for now)

      emit(LikeState(pokemonLikes: temporaryMockUser.likedPokemons()));
    });
  }
}

abstract class AbstractLikeEvent {}

class LikeEvent extends AbstractLikeEvent {
  final int number; // Pokemon number or ID
  LikeEvent(this.number);
}

class FindLikedEvent extends AbstractLikeEvent {
  final String? email;
  FindLikedEvent(this.email);
}

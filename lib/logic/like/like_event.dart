abstract class AbstractLikeEvent {}

class LikeEvent extends AbstractLikeEvent {
  final int number; // Pokemon number or ID
  final bool isLiked;
  LikeEvent(this.number, this.isLiked);
}

class FindLikedEvent extends AbstractLikeEvent {
  final String? uuid;
  FindLikedEvent(this.uuid);
}

class UserLoadedEvent extends AbstractLikeEvent {}

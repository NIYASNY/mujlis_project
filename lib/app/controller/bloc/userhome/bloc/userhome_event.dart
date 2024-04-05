abstract class UserHomeEvent {}

class UpdateUserIndexEvent extends UserHomeEvent {
  final int newIndex;

  UpdateUserIndexEvent(this.newIndex);
}

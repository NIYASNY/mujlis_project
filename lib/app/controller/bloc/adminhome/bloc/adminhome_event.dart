abstract class AdminPageEvent {}

class UpdateIndexEvent extends AdminPageEvent {
  final int newIndex;

  UpdateIndexEvent(this.newIndex);
}

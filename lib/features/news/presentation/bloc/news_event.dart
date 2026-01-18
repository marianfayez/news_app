abstract class NewsScreenEvent {}

class GetNewsEvent extends NewsScreenEvent {
  final String? sourceId;

  GetNewsEvent({this.sourceId});
}

class ChangeNewsIndexEvent extends NewsScreenEvent {
  final int index;
  ChangeNewsIndexEvent(this.index);
}

abstract class SourceScreenEvent {}

class GetSourcesEvent extends SourceScreenEvent {
  final String? catId;

  GetSourcesEvent({this.catId});
}

class ChangeSourceIndexEvent extends SourceScreenEvent {
  final int index;
  ChangeSourceIndexEvent(this.index);
}

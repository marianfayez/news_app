abstract class SourceScreenEvent {}

class GetSourcesEvent extends SourceScreenEvent {
  final String? catId;
  final bool useRemote;

  GetSourcesEvent({this.catId, required  this.useRemote});
}

class ChangeSourceIndexEvent extends SourceScreenEvent {
  final int index;
  ChangeSourceIndexEvent(this.index);
}

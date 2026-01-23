abstract class NewsScreenEvent {}

class GetNewsEvent extends NewsScreenEvent {
  final String? sourceId;

  GetNewsEvent({this.sourceId});
}


class SearchNewsEvent extends NewsScreenEvent {
  final String query;
  final String sourceId;

  SearchNewsEvent({
    required this.query,
    required this.sourceId,
  });
}
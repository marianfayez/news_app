abstract class ArticleWebViewEvent {}

class PageStartedEvent extends ArticleWebViewEvent {}

class PageFinishedEvent extends ArticleWebViewEvent {}

class PageErrorEvent extends ArticleWebViewEvent {
  final String message;
  PageErrorEvent(this.message);
}

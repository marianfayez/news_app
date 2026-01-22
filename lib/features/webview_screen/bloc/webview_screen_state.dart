enum ArticleWebViewStatus { initial, loading, success, error }

class ArticleWebViewState {
  final ArticleWebViewStatus status;
  final String? errorMessage;

  const ArticleWebViewState({
    this.status = ArticleWebViewStatus.initial,
    this.errorMessage,
  });

  ArticleWebViewState copyWith({
    ArticleWebViewStatus? status,
    String? errorMessage,
  }) {
    return ArticleWebViewState(
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}

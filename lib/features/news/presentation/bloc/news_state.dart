

import 'package:news_app/core/failuers/failuers.dart';
import 'package:news_app/features/news/data/models/news_model.dart';

enum NewsRequestState { initial, loading, success, error }

class NewsScreenState {
  NewsRequestState? getNewsState;
  NewsModel? newsModel;
  RouteFailures? newsFailures;
  final int selectedIndex;

  NewsScreenState({ this.selectedIndex = 0,

    this.getNewsState,
    this.newsModel,
    this.newsFailures,
  });

  NewsScreenState copyWith({
    int? selectedIndex,
    NewsRequestState? getNewsState,
    NewsModel? newsModel,
    RouteFailures? newsFailures,
  }) {
    return NewsScreenState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      getNewsState: getNewsState ?? this.getNewsState,
      newsModel: newsModel ?? this.newsModel,
      newsFailures: newsFailures ?? this.newsFailures,
    );
  }
}

class NewsScreenInitial extends NewsScreenState {
  NewsScreenInitial()
      : super(
    getNewsState: NewsRequestState.initial,
  );
}

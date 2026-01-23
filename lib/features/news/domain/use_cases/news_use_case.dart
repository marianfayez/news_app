import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/failuers.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repo.dart';

@injectable
class NewsUseCase {
  NewsRepo newsRepo;

  NewsUseCase(this.newsRepo);

  Future<Either<RouteFailures, NewsModel>> call({
    String? sourceId,
    required bool useRemote,  String? query,

  }) =>
      newsRepo.getNews(sourceId: sourceId, useRemote: useRemote,query: query);
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/failuers.dart';
import 'package:news_app/core/failuers/remote_failuers.dart';
import 'package:news_app/features/news/data/data_sources/remote/news_remote_ds.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repo.dart';

@Injectable(as: NewsRepo)
class NewsRepoImpl implements NewsRepo {
  NewsRemoteDs newsRemoteDs;

  NewsRepoImpl(this.newsRemoteDs);

  @override
  Future<Either<RouteFailures, NewsModel>> getNews({String? sourceId}) async {
    try {
      var result = await newsRemoteDs.getNews(sourceId: sourceId);
      if (result.status == 'ok') {
        return Right(result);
      } else {
        return Left(RemoteFailures(result.message ?? 'Error'));
      }    } catch (e) {
      return Left(RemoteFailures(e is Exception ? e.toString() : 'Error'));
    }
  }
}

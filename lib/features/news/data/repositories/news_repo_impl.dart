import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/failuers.dart';
import 'package:news_app/core/failuers/local_failuers.dart';
import 'package:news_app/core/failuers/remote_failuers.dart';
import 'package:news_app/features/news/data/data_sources/local/news_local_ds.dart';
import 'package:news_app/features/news/data/data_sources/remote/news_remote_ds.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repo.dart';

@Injectable(as: NewsRepo)
class NewsRepoImpl implements NewsRepo {
  NewsRemoteDs newsRemoteDs;
  NewsLocalDs newsLocalDs;

  NewsRepoImpl(this.newsRemoteDs, this.newsLocalDs);

  @override
  Future<Either<RouteFailures, NewsModel>> getNews({String? sourceId, required bool useRemote}) async {
    try {
      if (!useRemote) {
        final cachedSources = await newsLocalDs.getNews(sourceId: sourceId);

        if (cachedSources == null) {
          return Left(LocalFailures("No cached data"));
        }

        return Right(cachedSources);
      }
      var result =
          await newsRemoteDs.getNews(sourceId: sourceId, useRemote: useRemote);
      if (result.status == 'ok') {
        await newsLocalDs.saveNews(result, sourceId ?? '');
        return Right(result);
      } else {
        return Left(RemoteFailures(result.message ?? 'Error'));
      }
    } catch (e) {
      return Left(RemoteFailures(e is Exception ? e.toString() : 'Error'));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/failuers.dart';
import 'package:news_app/core/failuers/local_failuers.dart';
import 'package:news_app/core/failuers/remote_failuers.dart';
import 'package:news_app/features/sources/data/data_sources/local/source_local_ds.dart';
import 'package:news_app/features/sources/data/data_sources/remote/source_remote_ds.dart';
import 'package:news_app/features/sources/data/model/sources_model.dart';
import 'package:news_app/features/sources/domain/repositories/source_repo.dart';

@Injectable(as: SourceRepo)
class SourceRepoImpl implements SourceRepo {
  SourceRemoteDs sourceRemoteDs;
  SourceLocalDs sourceLocalDs;

  SourceRepoImpl(this.sourceRemoteDs,this.sourceLocalDs);

  @override
  Future<Either<RouteFailures, SourcesModel>> getSources(
      {String? catId, required bool useRemote}) async {
    try {
      if (!useRemote) {
        final cachedSources = await sourceLocalDs.getSources(catId: catId);

        if (cachedSources == null) {
          return Left(LocalFailures("No cached data"));
        }

        return Right(cachedSources);
      }
      var result =
          await sourceRemoteDs.getSources(catId: catId, useRemote: useRemote);
      if (result.status == 'ok') {
        await sourceLocalDs.saveSources(result, catId ?? '');
        return Right(result);
      } else {
        return Left(RemoteFailures(result.message ?? 'Error'));
      }
    } catch (e) {
      return Left(RemoteFailures(e is Exception ? e.toString() : 'Error'));
    }
  }
}

import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/failuers.dart';
import 'package:news_app/core/failuers/remote_failuers.dart';
import 'package:news_app/features/sources/data/data_sources/remote/source_remote_ds.dart';
import 'package:news_app/features/sources/data/model/sources_model.dart';
import 'package:news_app/features/sources/domain/repositories/source_repo.dart';

@Injectable(as: SourceRepo)
class SourceRepoImpl implements SourceRepo {
  SourceRemoteDs sourceRemoteDs;

  SourceRepoImpl(this.sourceRemoteDs);


  @override
  Future<Either<RouteFailures, SourcesModel>> getSources(
      {String? catId}) async {
    try {
      var result = await sourceRemoteDs.getSources(catId: catId);
      if (result.status == 'ok') {
        return Right(result);
      } else {
        return Left(RemoteFailures(result.message ?? 'Error'));
      }    } catch (e) {
      return Left(
          RemoteFailures(e is Exception ? e.toString() : 'Error'));
    }
  }
}
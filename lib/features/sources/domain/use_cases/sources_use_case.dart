import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/failuers.dart';
import 'package:news_app/features/sources/data/model/sources_model.dart';
import 'package:news_app/features/sources/domain/repositories/source_repo.dart';

@injectable
class SourcesUseCase {
  SourceRepo sourceRepo;

  SourcesUseCase(this.sourceRepo);

  Future<Either<RouteFailures, SourcesModel>> call({String? catId}) =>
      sourceRepo.getSources(catId: catId);
}

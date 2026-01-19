import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/internet_failure.dart';
import 'package:news_app/core/utilities/internet_utils.dart';
import 'package:news_app/features/internet_service/domain/repositories/Connectivity_repo.dart';

@injectable
class ConnectivityUseCase {
  final ConnectivityRepository connectivityService;

  ConnectivityUseCase(this.connectivityService);
  Future<Either<InternetFailure, bool>> call() async {
    try {
      final result = await hasActualInternet(); // <-- هنا
      return Right(result);
    } catch (e) {
      return Left(InternetFailure(message: e.toString()));
    }
  }

  Stream<Either<InternetFailure, bool>> watchConnection() {
    return connectivityService.connectionChanges
        .asyncMap((_) async => Right(await hasActualInternet()));  }
}

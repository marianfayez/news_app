import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/internet_failure.dart';
import 'package:news_app/features/internet_service/data/data_sources/remote/Connectivity_remote_ds.dart';
import 'package:news_app/features/internet_service/domain/repositories/Connectivity_repo.dart';


@Injectable(as: ConnectivityRepository)
class ConnectivityRepoImpl implements ConnectivityRepository {
  final ConnectivityRemoteDs  connectivityRemoteDs;

  ConnectivityRepoImpl(this.connectivityRemoteDs);

  @override
  Future<Either<InternetFailure, bool>> isConnected() async {
    try {
      final result = await connectivityRemoteDs.checkConnection();
      return Right(result);
    } catch (e) {
      return Left(InternetFailure(message: e.toString()));
    }
  }

  @override
  Stream<bool> get connectionChanges => connectivityRemoteDs.connectionStream;

}

import 'package:dartz/dartz.dart';
import 'package:news_app/core/failuers/internet_failure.dart';


abstract class ConnectivityRepository {

  Future<Either<InternetFailure, bool>> isConnected();
  Stream<bool> get connectionChanges;
}
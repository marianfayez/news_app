import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/internet_service/data/data_sources/remote/Connectivity_remote_ds.dart';

@LazySingleton(as: ConnectivityRemoteDs)
class ConnectivityRemoteDsImpl implements ConnectivityRemoteDs {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionStreamController =
      StreamController.broadcast();

  ConnectivityRemoteDsImpl() {
    _connectivity.onConnectivityChanged.listen((event) {
      bool isConnected;

      isConnected = event.any((r) => r != ConnectivityResult.none);

      _connectionStreamController.add(isConnected);
    });
  }

  @override
  Future<bool> checkConnection() async {
    var result = await _connectivity.checkConnectivity();
    return result.any((r) => r != ConnectivityResult.none);
  }

  @override
  Stream<bool> get connectionStream => _connectionStreamController.stream;

  bool _isConnected(ConnectivityResult result) {
    return result != ConnectivityResult.none;
  }

  void dispose() {
    _connectionStreamController.close();
  }
}

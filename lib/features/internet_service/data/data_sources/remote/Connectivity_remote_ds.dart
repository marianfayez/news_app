abstract class ConnectivityRemoteDs {
  Future<bool> checkConnection();
  Stream<bool> get connectionStream;
}

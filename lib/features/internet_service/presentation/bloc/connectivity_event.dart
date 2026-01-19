abstract class ConnectivityEvent {}

class CheckConnectionEvent extends ConnectivityEvent {}

class ConnectivityChangedEvent extends ConnectivityEvent {
  final bool isConnected;
  ConnectivityChangedEvent(this.isConnected);
}

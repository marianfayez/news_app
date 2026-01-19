enum ConnectivityRequestState { initial, loading, connected, disconnected, error }

class ConnectivityState {
  final ConnectivityRequestState requestState;
  final String? failureMessage;

  ConnectivityState({
    this.requestState = ConnectivityRequestState.initial,
    this.failureMessage,
  });

  ConnectivityState copyWith({
    ConnectivityRequestState? requestState,
    String? failureMessage,
  }) {
    return ConnectivityState(
      requestState: requestState ?? this.requestState,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }
}

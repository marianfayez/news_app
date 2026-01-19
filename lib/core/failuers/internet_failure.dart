class InternetFailure {
  final String message;

  InternetFailure({required this.message});
}
class NoInternetFailure extends InternetFailure {
  NoInternetFailure() : super(message: "No internet connection");
}

class UnknownInternetFailure extends InternetFailure {
  UnknownInternetFailure({String msg = "Unknown error"}) : super(message: msg);
}

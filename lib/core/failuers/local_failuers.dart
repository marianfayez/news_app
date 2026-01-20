import 'package:news_app/core/failuers/failuers.dart';

class LocalFailures extends RouteFailures {
  final String message;

  LocalFailures(this.message) : super('');

  @override
  List<Object?> get props => [message];
}

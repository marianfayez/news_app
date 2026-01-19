import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/utilities/internet_utils.dart';
import 'package:news_app/features/internet_service/domain/use_cases/internet_use_case.dart';
import 'package:news_app/features/internet_service/presentation/bloc/connectivity_event.dart';
import 'package:news_app/features/internet_service/presentation/bloc/connectivity_state.dart';

@injectable
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final ConnectivityUseCase useCase;

  ConnectivityBloc(this.useCase) : super(ConnectivityState()) {
    // on<CheckConnectionEvent>((event, emit) async {
    //   emit(state.copyWith(requestState: ConnectivityRequestState.loading));
    //
    //   final result = await useCase();
    //   result.fold(
    //         (fail) => emit(state.copyWith(
    //         requestState: ConnectivityRequestState.error,
    //         failureMessage: fail.message)),
    //
    //         (isConnected) => emit(state.copyWith(
    //         requestState: isConnected
    //             ? ConnectivityRequestState.connected
    //             : ConnectivityRequestState.disconnected)),
    //   );
    // });

    on<CheckConnectionEvent>((event, emit) async {
      emit(state.copyWith(requestState: ConnectivityRequestState.loading));

      bool isConnected = await hasActualInternet();
      print('Is connected? $isConnected');
      emit(state.copyWith(
        requestState: isConnected
            ? ConnectivityRequestState.connected
            : ConnectivityRequestState.disconnected,
      ));
    });


    on<ConnectivityChangedEvent>((event, emit) {
      emit(state.copyWith(
          requestState: event.isConnected
              ? ConnectivityRequestState.connected
              : ConnectivityRequestState.disconnected));
    });

    // Listen to stream
    useCase.watchConnection().listen((result) {
      result.fold(
            (_) {},
            (isConnected) => add(ConnectivityChangedEvent(isConnected)),
      );
    });
  }
}

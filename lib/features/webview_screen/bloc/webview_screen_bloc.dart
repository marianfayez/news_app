import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/webview_screen/bloc/webview_screen_event.dart';
import 'package:news_app/features/webview_screen/bloc/webview_screen_state.dart';


@injectable
class ArticleWebViewBloc
    extends Bloc<ArticleWebViewEvent, ArticleWebViewState> {
  ArticleWebViewBloc() : super(const ArticleWebViewState()) {
    on<PageStartedEvent>((event, emit) {
      emit(state.copyWith(status: ArticleWebViewStatus.loading));
    });

    on<PageFinishedEvent>((event, emit) {
      emit(state.copyWith(status: ArticleWebViewStatus.success));
    });

    on<PageErrorEvent>((event, emit) {
      emit(state.copyWith(
        status: ArticleWebViewStatus.error,
        errorMessage: event.message,
      ));
    });
  }
}

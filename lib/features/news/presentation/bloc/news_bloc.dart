import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/news/domain/use_cases/news_use_case.dart';
import 'package:news_app/features/news/presentation/bloc/news_event.dart';
import 'package:news_app/features/news/presentation/bloc/news_state.dart';



@injectable
class NewsScreenBloc extends Bloc<NewsScreenEvent, NewsScreenState> {
  final NewsUseCase getNewsUseCase;

  NewsScreenBloc(
      this.getNewsUseCase,
      ) : super(NewsScreenInitial()) {
    on<NewsScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetNewsEvent>((event, emit) async {
      print('🔥 GetNewsEvent fired with catId = ${event.sourceId}');

      emit(state.copyWith(getNewsState: NewsRequestState.loading));

      var result = await getNewsUseCase(sourceId: event.sourceId);

      result.fold((l) {
        emit(state.copyWith(
            getNewsState: NewsRequestState.error, newsFailures: l));
      }, (r) {
        emit(state.copyWith(
          getNewsState: NewsRequestState.success,
          newsModel: r,
        ));
      });
    });

    on<ChangeNewsIndexEvent>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}

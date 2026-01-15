import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/failuers.dart';
import 'package:news_app/features/sources/data/model/sources_model.dart';
import 'package:news_app/features/sources/domain/use_cases/sources_use_case.dart';
import 'package:news_app/features/sources/presentation/bloc/source_screen_event.dart';

part 'source_screen_state.dart';

@injectable
class SourceScreenBloc extends Bloc<SourceScreenEvent, SourceScreenState> {
  final SourcesUseCase getSourceUseCase;

  SourceScreenBloc(
    this.getSourceUseCase,
  ) : super(SourceScreenInitial()) {
    on<SourceScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetSourcesEvent>((event, emit) async {
      print('🔥 GetSourcesEvent fired with catId = ${event.catId}');

      emit(state.copyWith(getSourcesState: SourceRequestState.loading));

      var result = await getSourceUseCase(catId: event.catId);

      result.fold((l) {
        print(l.message);
        emit(state.copyWith(
            getSourcesState: SourceRequestState.error, sourceFailures: l));
      }, (r) {
        emit(state.copyWith(
          getSourcesState: SourceRequestState.success,
          sourcesModel: r,
        ));
      });
    });

    on<ChangeSourceIndexEvent>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}

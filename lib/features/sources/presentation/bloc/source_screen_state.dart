part of 'source_screen_bloc.dart';

enum SourceRequestState { initial, loading, success, error }

class SourceScreenState {
  SourceRequestState? getSourcesState;
  SourcesModel? sourcesModel;
  RouteFailures? sourceFailures;
  final int selectedIndex;

  SourceScreenState({    this.selectedIndex = 0,

    this.getSourcesState,
    this.sourcesModel,
    this.sourceFailures,
  });

  SourceScreenState copyWith({
    int? selectedIndex,
    SourceRequestState? getSourcesState,
    SourcesModel? sourcesModel,
    RouteFailures? sourceFailures,
  }) {
    return SourceScreenState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      getSourcesState: getSourcesState ?? this.getSourcesState,
      sourcesModel: sourcesModel ?? this.sourcesModel,
      sourceFailures: sourceFailures ?? this.sourceFailures,
    );
  }
}

class SourceScreenInitial extends SourceScreenState {
  SourceScreenInitial()
      : super(
          getSourcesState: SourceRequestState.initial,
        );
}

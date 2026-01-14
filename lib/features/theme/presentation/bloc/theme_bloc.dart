import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeMode: ThemeMode.dark)) {
    on<ThemeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangeThemeEvent>((event, emit) {
      emit(ThemeState(themeMode: event.themeMode));
    });
  }
}

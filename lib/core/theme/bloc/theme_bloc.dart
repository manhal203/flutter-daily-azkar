import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(SwitchThemeState(themeMode: ThemeMode.light)) {

    on<SwitchThemeEvent>((event, emit) {
      if ((state as SwitchThemeState).themeMode == ThemeMode.light) {
        emit(SwitchThemeState(themeMode: ThemeMode.dark));
      } else {
        emit(SwitchThemeState(themeMode: ThemeMode.light));
      }
    });

  }
}

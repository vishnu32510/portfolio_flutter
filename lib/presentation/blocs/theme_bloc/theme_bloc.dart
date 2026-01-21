import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/theme_enums.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState.lightTheme) {
    on<ThemeEventChange>((event, emit) {
      switch (event.currentTheme) {
        case ThemeType.darkMode:
          emit(DarkThemeState.darkTheme);
          break;
        case ThemeType.lightMode:
          emit(LightThemeState.lightTheme);
          break;
        case ThemeType.system:
          emit(SystemThemeState.systemTheme);
          break;
      }
    });
  }
}

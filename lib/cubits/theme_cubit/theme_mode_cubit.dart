import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(DarkModeState());
  setThemeMode({bool isDark = true}) {
    if (isDark) {
      emit(DarkModeState());
    } else {
      emit(LightModeState());
    }
  }
}

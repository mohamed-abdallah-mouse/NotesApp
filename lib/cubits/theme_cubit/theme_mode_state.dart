part of 'theme_mode_cubit.dart';

@immutable
sealed class ThemeModeState {}

final class LightModeState extends ThemeModeState {}

final class DarkModeState extends ThemeModeState {}

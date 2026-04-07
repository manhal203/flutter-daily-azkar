part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class SwitchThemeState extends ThemeState{
final ThemeMode themeMode;

  SwitchThemeState({required this.themeMode});
}

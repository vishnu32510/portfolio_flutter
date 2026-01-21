part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ThemeEventChange extends ThemeEvent {
  final ThemeType currentTheme;
  const ThemeEventChange(this.currentTheme);

  @override
  List<Object?> get props => [currentTheme];
}

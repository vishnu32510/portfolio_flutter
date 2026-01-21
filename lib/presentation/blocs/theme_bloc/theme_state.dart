part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  final ThemeData themeData;
  final ThemeMode themeMode;
  final ThemeType themeEventType;

  const ThemeState({
    required this.themeData,
    required this.themeMode,
    required this.themeEventType,
  });

  @override
  List<Object?> get props => [themeData, themeMode, themeEventType];

  // Cream color palette
  static const Color creamPrimary = Color(0xFFF5E6D3); // Warm cream
  static const Color creamPrimaryDark = Color(0xFFD4C4B0); // Darker cream for dark theme
  static const Color creamPrimaryLight = Color(0xFFB89A7A); // Dark cream for light mode (better visibility)
  static const Color creamLight = Color(0xFFFFF8E7); // Light cream
  static const Color creamDark = Color(0xFFE8DCC6); // Medium cream
}

class DarkThemeState extends ThemeState {
  const DarkThemeState({
    required super.themeData,
    required super.themeMode,
    required super.themeEventType,
  });

  static ThemeState get darkTheme => ThemeState(
        themeData: ThemeData.dark(useMaterial3: true).copyWith(
          colorScheme: ColorScheme.dark(
            primary: ThemeState.creamPrimaryDark,
            onPrimary: const Color(0xFF1A1A1A),
            secondary: ThemeState.creamDark,
            onSecondary: const Color(0xFF1A1A1A),
            surface: const Color(0xFF0C0C0C),
            onSurface: const Color(0xFFFFFFFF),
          ),
          scaffoldBackgroundColor: const Color(0xFF0C0C0C),
        ),
        themeMode: ThemeMode.dark,
        themeEventType: ThemeType.darkMode,
      );
}

class LightThemeState extends ThemeState {
  const LightThemeState({
    required super.themeData,
    required super.themeMode,
    required super.themeEventType,
  });

  static ThemeState get lightTheme => ThemeState(
        themeData: ThemeData.light(useMaterial3: true).copyWith(
          colorScheme: ColorScheme.light(
            primary: ThemeState.creamPrimaryLight, // Dark cream for better visibility in light mode
            onPrimary: const Color(0xFFFFFFFF),
            secondary: ThemeState.creamPrimaryDark,
            onSecondary: const Color(0xFF1A1A1A),
            surface: const Color(0xFFF4F5F6),
            onSurface: const Color(0xFF0E121D),
          ),
          scaffoldBackgroundColor: const Color(0xFFF4F5F6),
        ),
        themeMode: ThemeMode.light,
        themeEventType: ThemeType.lightMode,
      );
}

class SystemThemeState extends ThemeState {
  const SystemThemeState({
    required super.themeData,
    required super.themeMode,
    required super.themeEventType,
  });

  static ThemeState get systemTheme => ThemeState(
        themeData: ThemeData.light(useMaterial3: true).copyWith(
          colorScheme: ColorScheme.light(
            primary: ThemeState.creamPrimaryLight, // Dark cream for better visibility in light mode
            onPrimary: const Color(0xFFFFFFFF),
            secondary: ThemeState.creamPrimaryDark,
            onSecondary: const Color(0xFF1A1A1A),
            surface: const Color(0xFFF4F5F6),
            onSurface: const Color(0xFF0E121D),
          ),
          scaffoldBackgroundColor: const Color(0xFFF4F5F6),
        ),
        themeMode: ThemeMode.system,
        themeEventType: ThemeType.system,
      );
}

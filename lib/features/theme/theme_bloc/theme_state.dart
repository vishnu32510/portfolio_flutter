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
  static const Color creamPrimaryDark = Color(
    0xFFD4C4B0,
  ); // Darker cream for dark theme
  static const Color creamPrimaryLight = Color(
    0xFFB89A7A,
  ); // Dark cream for light mode (better visibility)
  static const Color creamLight = Color(0xFFFFF8E7); // Light cream
  static const Color creamDark = Color(0xFFE8DCC6); // Medium cream

  // Spider-Man Brand New Day color palette
  static const Color spiderRed = Color(0xFFE62429); // Marvel Spider-Red
  static const Color spiderRedBright = Color(0xFFFF334B); // Bright hero crimson
  static const Color spiderBlue = Color(
    0xFF38BDF8,
  ); // Iconic Electric Web Light Blue
  static const Color spiderBlueCobalt = Color(
    0xFF1E88E5,
  ); // Deep Web Cobalt Blue
  static const Color spiderDarkSurface = Color(
    0xFF0B0F19,
  ); // Midnight ink background
  static const Color spiderCardSurface = Color(
    0xFF141B2D,
  ); // Subtle slate-navy card
  static const Color spiderWebOutline = Color(
    0x33E62429,
  ); // Web red accent border
}

class DarkThemeState extends ThemeState {
  const DarkThemeState({
    required super.themeData,
    required super.themeMode,
    required super.themeEventType,
  });

  static ThemeState get darkTheme {
    final baseTheme = ThemeData.dark(useMaterial3: true);
    return ThemeState(
      themeData: baseTheme.copyWith(
        textTheme: GoogleFonts.outfitTextTheme(baseTheme.textTheme),
        extensions: const [AppCustomColors.dark],
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
}

class SpiderManThemeState extends ThemeState {
  const SpiderManThemeState({
    required super.themeData,
    required super.themeMode,
    required super.themeEventType,
  });

  static ThemeState get spiderManTheme {
    final baseTheme = ThemeData.dark(useMaterial3: true);
    return ThemeState(
      themeData: baseTheme.copyWith(
        textTheme: GoogleFonts.outfitTextTheme(baseTheme.textTheme),
        extensions: const [AppCustomColors.spiderMan],
        colorScheme: const ColorScheme.dark(
          primary: ThemeState.spiderRed,
          onPrimary: Color(0xFFFFFFFF),
          secondary: ThemeState.spiderBlue,
          onSecondary: Color(0xFF0B0F19),
          tertiary: ThemeState.spiderBlueCobalt,
          surface: ThemeState.spiderDarkSurface,
          onSurface: Color(0xFFF1F5F9),
          outline: Color(0xFF2A364F),
        ),
        scaffoldBackgroundColor: ThemeState.spiderDarkSurface,
        cardColor: ThemeState.spiderCardSurface,
      ),
      themeMode: ThemeMode.dark,
      themeEventType: ThemeType.spiderMan,
    );
  }
}

class LightThemeState extends ThemeState {
  const LightThemeState({
    required super.themeData,
    required super.themeMode,
    required super.themeEventType,
  });

  static ThemeState get lightTheme {
    final baseTheme = ThemeData.light(useMaterial3: true);
    return ThemeState(
      themeData: baseTheme.copyWith(
        textTheme: GoogleFonts.outfitTextTheme(baseTheme.textTheme),
        extensions: const [AppCustomColors.light],
        colorScheme: ColorScheme.light(
          primary: ThemeState
              .creamPrimaryLight, // Dark cream for better visibility in light mode
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
}

class SystemThemeState extends ThemeState {
  const SystemThemeState({
    required super.themeData,
    required super.themeMode,
    required super.themeEventType,
  });

  static ThemeState get systemTheme {
    final baseTheme = ThemeData.light(useMaterial3: true);
    return ThemeState(
      themeData: baseTheme.copyWith(
        textTheme: GoogleFonts.outfitTextTheme(baseTheme.textTheme),
        extensions: const [AppCustomColors.light],
        colorScheme: ColorScheme.light(
          primary: ThemeState
              .creamPrimaryLight, // Dark cream for better visibility in light mode
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
}

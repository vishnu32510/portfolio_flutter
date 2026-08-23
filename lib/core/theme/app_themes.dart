import 'package:code_store_theme/code_store_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

/// App-specific theme suite for the portfolio.
class AppThemes {
  // Cream brand color palette
  static const Color creamPrimary = Color(0xFFF5E6D3);
  static const Color creamPrimaryDark = Color(0xFFD4C4B0);
  static const Color creamPrimaryLight = Color(0xFFB89A7A);
  static const Color creamLight = Color(0xFFFFF8E7);
  static const Color creamDark = Color(0xFFE8DCC6);

  // Spider-Man: Brand New Day color palette
  static const Color spiderRed = Color(0xFFE62429);
  static const Color spiderRedBright = Color(0xFFFF334B);
  static const Color spiderBlue = Color(0xFF38BDF8);
  static const Color spiderBlueCobalt = Color(0xFF1E88E5);
  static const Color spiderDarkSurface = Color(0xFF0B0F19);
  static const Color spiderCardSurface = Color(0xFF141B2D);

  /// 1. Dark Executive Theme
  static AppThemeConfig get dark {
    final base = ThemeData.dark(useMaterial3: true);
    return AppThemeConfig(
      id: 'dark',
      name: 'Dark',
      icon: Icons.nightlight_round,
      themeMode: ThemeMode.dark,
      themeData: base.copyWith(
        textTheme: GoogleFonts.outfitTextTheme(base.textTheme),
        extensions: const [AppCustomColors.dark],
        colorScheme: ColorScheme.dark(
          primary: creamPrimaryDark,
          onPrimary: const Color(0xFF1A1A1A),
          secondary: creamDark,
          onSecondary: const Color(0xFF1A1A1A),
          surface: const Color(0xFF0C0C0C),
          onSurface: const Color(0xFFFFFFFF),
        ),
        scaffoldBackgroundColor: const Color(0xFF0C0C0C),
      ),
    );
  }

  /// 2. Spider-Man: Brand New Day Theme (Red Grid & Electric Blue Runners/Particles)
  static AppThemeConfig get spiderMan {
    final base = ThemeData.dark(useMaterial3: true);
    return AppThemeConfig(
      id: 'spider_man',
      name: 'Spider-Man: Brand New Day',
      icon: FontAwesomeIcons.spider,
      themeMode: ThemeMode.dark,
      themeData: base.copyWith(
        textTheme: GoogleFonts.outfitTextTheme(base.textTheme),
        extensions: const [AppCustomColors.spiderMan],
        colorScheme: const ColorScheme.dark(
          primary: spiderRed,
          onPrimary: Color(0xFFFFFFFF),
          secondary: spiderBlue,
          onSecondary: Color(0xFF0B0F19),
          tertiary: spiderBlueCobalt,
          surface: spiderDarkSurface,
          onSurface: Color(0xFFF1F5F9),
          outline: Color(0xFF2A364F),
        ),
        scaffoldBackgroundColor: spiderDarkSurface,
        cardColor: spiderCardSurface,
      ),
    );
  }

  /// 3. Light Editorial Theme
  static AppThemeConfig get light {
    final base = ThemeData.light(useMaterial3: true);
    return AppThemeConfig(
      id: 'light',
      name: 'Light',
      icon: Icons.wb_sunny_rounded,
      themeMode: ThemeMode.light,
      themeData: base.copyWith(
        textTheme: GoogleFonts.outfitTextTheme(base.textTheme),
        extensions: const [AppCustomColors.light],
        colorScheme: ColorScheme.light(
          primary: creamPrimaryLight,
          onPrimary: const Color(0xFFFFFFFF),
          secondary: creamPrimaryDark,
          onSecondary: const Color(0xFF1A1A1A),
          surface: const Color(0xFFF4F5F6),
          onSurface: const Color(0xFF0E121D),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F5F6),
      ),
    );
  }

  /// All registered themes for the portfolio
  static List<AppThemeConfig> get allThemes => [dark, spiderMan, light];
}

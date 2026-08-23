import 'package:code_store_theme/code_store_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

/// App-specific theme suite for the portfolio.
/// All underlying colors are sourced directly from [AppColors].
class AppThemes {
  // Aliases for quick access to palette definitions
  static const Color spiderRed = AppColors.spiderRed;
  static const Color spiderBlue = AppColors.spiderBlue;

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
        colorScheme: const ColorScheme.dark(
          primary: AppColors.creamPrimaryDark,
          onPrimary: Color(0xFF1A1A1A),
          secondary: AppColors.creamDark,
          onSecondary: Color(0xFF1A1A1A),
          surface: AppColors.darkSurface,
          onSurface: Color(0xFFFFFFFF),
        ),
        scaffoldBackgroundColor: AppColors.darkScaffold,
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
          primary: AppColors.spiderRed,
          onPrimary: Color(0xFFFFFFFF),
          secondary: AppColors.spiderBlue,
          onSecondary: Color(0xFF0B0F19),
          tertiary: AppColors.spiderBlueCobalt,
          surface: AppColors.spiderDarkSurface,
          onSurface: Color(0xFFF1F5F9),
          outline: Color(0xFF2A364F),
        ),
        scaffoldBackgroundColor: AppColors.spiderDarkSurface,
        cardColor: AppColors.spiderCardSurface,
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
        colorScheme: const ColorScheme.light(
          primary: AppColors.creamPrimaryLight,
          onPrimary: Color(0xFFFFFFFF),
          secondary: AppColors.creamPrimaryDark,
          onSecondary: Color(0xFF1A1A1A),
          surface: AppColors.lightSurface,
          onSurface: Color(0xFF0E121D),
        ),
        scaffoldBackgroundColor: AppColors.lightScaffold,
      ),
    );
  }

  /// All registered themes for the portfolio
  static List<AppThemeConfig> get allThemes => [dark, spiderMan, light];
}

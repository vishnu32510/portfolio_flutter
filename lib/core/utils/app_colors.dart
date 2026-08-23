import 'package:flutter/material.dart';

/// Single source of truth for all color palettes, custom colors, and legacy aliases
class AppColors {
  // Brand Cream Palette
  static const Color creamPrimary = Color(0xFFF5E6D3);
  static const Color creamPrimaryDark = Color(0xFFD4C4B0);
  static const Color creamPrimaryLight = Color(0xFFB89A7A);
  static const Color creamLight = Color(0xFFFFF8E7);
  static const Color creamDark = Color(0xFFE8DCC6);

  // Spider-Man: Brand New Day Palette
  static const Color spiderRed = Color(0xFFE62429);
  static const Color spiderRedBright = Color(0xFFFF334B);
  static const Color spiderBlue = Color(0xFF38BDF8);
  static const Color spiderBlueCobalt = Color(0xFF1E88E5);
  static const Color spiderDarkSurface = Color(0xFF0B0F19);
  static const Color spiderCardSurface = Color(0xFF141B2D);

  // Neutral & Surface Palettes
  static const Color darkScaffold = Color(0xFF0C0C0C);
  static const Color darkSurface = Color(0xFF0C0C0C);
  static const Color lightScaffold = Color(0xFFF4F5F6);
  static const Color lightSurface = Color(0xFFF4F5F6);

  // Legacy & UI Compatibility Aliases
  static const Color white = Color(0xffffffff);
  static const Color lightColor = Color(0xffcccccc);
  static const Color lowPriority = Color(0xff848191);
  static const Color primaryColor = Color(0x9936E2FF);
  static const Color secondaryColor = Color(0xffbb86fc);
  static const Color darkColor = Color(0xff000036);
  static const Color scaffoldColor = Color(0xff1A1A29);
  static const Color appBarColor = Color(0xff9999d4);
  static const Color blueColor = Color(0xff4a51e0);
  static const Color primaryLight = Color(0xff31313F);
  static const Color greenColor = Color(0xf461df25);
  static const Color redColor = Color(0xf4df2535);
  static const Color transparent = Colors.transparent;
}

/// Scalable Custom Theme Tokens via Flutter's ThemeExtension
@immutable
class AppCustomColors extends ThemeExtension<AppCustomColors> {
  final Color gridLine;
  final Color laserRunner;
  final Color glowColor;
  final Color particleColor;
  final Color particleLine;
  final Color cardBackground;
  final Color accentGlow;

  const AppCustomColors({
    required this.gridLine,
    required this.laserRunner,
    required this.glowColor,
    required this.particleColor,
    required this.particleLine,
    required this.cardBackground,
    required this.accentGlow,
  });

  // 1. Dark Executive Preset (Warm Cream & Obsidian)
  static const dark = AppCustomColors(
    gridLine: Color(0x1AD4C4B0),
    laserRunner: AppColors.creamPrimaryDark,
    glowColor: Color(0x33D4C4B0),
    particleColor: Color(0x66D4C4B0),
    particleLine: Color(0x28D4C4B0),
    cardBackground: Color(0xFF141414),
    accentGlow: Color(0x22D4C4B0),
  );

  // 2. Spider-Man: Brand New Day Preset (Red Grid & Electric Blue Runners/Particles)
  static const spiderMan = AppCustomColors(
    gridLine: Color(0x30E62429), // Spider-Red grid lines
    laserRunner: AppColors.spiderBlue, // Electric Web Blue running lines
    glowColor: Color(0x4438BDF8), // Electric blue glow
    particleColor: Color(0x8038BDF8), // Electric Web Blue particle nodes
    particleLine: Color(0x3838BDF8), // Web particle lines
    cardBackground: AppColors.spiderCardSurface, // Midnight slate card
    accentGlow: Color(0x40E62429), // Crimson web accent glow
  );

  // 3. Light Editorial Preset (Warm Cream & Slate)
  static const light = AppCustomColors(
    gridLine: Color(0x14000000),
    laserRunner: AppColors.creamPrimaryLight,
    glowColor: Color(0x20B89A7A),
    particleColor: Color(0x40B89A7A),
    particleLine: Color(0x1AB89A7A),
    cardBackground: AppColors.white,
    accentGlow: Color(0x1CB89A7A),
  );

  @override
  AppCustomColors copyWith({
    Color? gridLine,
    Color? laserRunner,
    Color? glowColor,
    Color? particleColor,
    Color? particleLine,
    Color? cardBackground,
    Color? accentGlow,
  }) {
    return AppCustomColors(
      gridLine: gridLine ?? this.gridLine,
      laserRunner: laserRunner ?? this.laserRunner,
      glowColor: glowColor ?? this.glowColor,
      particleColor: particleColor ?? this.particleColor,
      particleLine: particleLine ?? this.particleLine,
      cardBackground: cardBackground ?? this.cardBackground,
      accentGlow: accentGlow ?? this.accentGlow,
    );
  }

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;
    return AppCustomColors(
      gridLine: Color.lerp(gridLine, other.gridLine, t)!,
      laserRunner: Color.lerp(laserRunner, other.laserRunner, t)!,
      glowColor: Color.lerp(glowColor, other.glowColor, t)!,
      particleColor: Color.lerp(particleColor, other.particleColor, t)!,
      particleLine: Color.lerp(particleLine, other.particleLine, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      accentGlow: Color.lerp(accentGlow, other.accentGlow, t)!,
    );
  }
}

/// Ergonomic BuildContext extensions for clean access across all widgets
extension AppCustomColorsExtension on BuildContext {
  AppCustomColors get customColors =>
      Theme.of(this).extension<AppCustomColors>() ?? AppCustomColors.dark;

  AppCustomColors get appColors => customColors;
}

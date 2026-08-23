import 'package:flutter/material.dart';

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
    laserRunner: Color(0xFFD4C4B0),
    glowColor: Color(0x33D4C4B0),
    particleColor: Color(0x66D4C4B0),
    particleLine: Color(0x28D4C4B0),
    cardBackground: Color(0xFF141414),
    accentGlow: Color(0x22D4C4B0),
  );

  // 2. Spider-Man: Brand New Day Preset (Red Grid & Electric Blue Runners/Particles)
  static const spiderMan = AppCustomColors(
    gridLine: Color(0x30E62429), // Spider-Red grid lines
    laserRunner: Color(0xFF38BDF8), // Electric Web Blue running lines
    glowColor: Color(0x4438BDF8), // Electric blue glow
    particleColor: Color(0x8038BDF8), // Electric Web Blue particle nodes
    particleLine: Color(0x3838BDF8), // Web particle lines
    cardBackground: Color(0xFF141B2D), // Midnight slate card
    accentGlow: Color(0x40E62429), // Crimson web accent glow
  );

  // 3. Light Editorial Preset (Warm Cream & Slate)
  static const light = AppCustomColors(
    gridLine: Color(0x14000000),
    laserRunner: Color(0xFFB89A7A),
    glowColor: Color(0x20B89A7A),
    particleColor: Color(0x40B89A7A),
    particleLine: Color(0x1AB89A7A),
    cardBackground: Color(0xFFFFFFFF),
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

/// Backward-compatibility legacy AppColors
extension AppColors on ThemeData {
  static Color white = const Color(0xffffffff);
  static Color lightColor = const Color(0xffcccccc);
  static Color lowPriority = const Color(0xff848191);
  static Color primaryColor = const Color(0x9936E2FF);
  static Color secondaryColor = const Color(0xffbb86fc);
  static Color darkColor = const Color(0xff000036);
  static Color scaffoldColor = const Color(0xff1A1A29);
  static Color appBarColor = const Color(0xff9999d4);
  static Color blueColor = const Color(0xff4a51e0);
  static Color primaryLight = const Color(0xff31313F);
  static Color greenColor = const Color(0xf461df25);
  static Color redColor = const Color(0xf4df2535);
}

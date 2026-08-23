import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ThemeType {
  darkMode, // Event for toggling to dark theme
  spiderMan, // Event for toggling to Spider-Man: Brand New Day theme
  lightMode, // Event for toggling to light theme
  system, // Event for toggling to system theme
}

extension ThemeTypeDetails on ThemeType {
  String get themeName {
    switch (this) {
      case ThemeType.darkMode:
        return "Dark";
      case ThemeType.spiderMan:
        return "Spider-Man: Brand New Day";
      case ThemeType.lightMode:
        return "Light";
      case ThemeType.system:
        return "System";
    }
  }

  dynamic get iconData {
    switch (this) {
      case ThemeType.darkMode:
        return Icons.nightlight_round;
      case ThemeType.spiderMan:
        return FontAwesomeIcons.spider;
      case ThemeType.lightMode:
        return Icons.wb_sunny_rounded;
      case ThemeType.system:
        return Icons.sync_sharp;
    }
  }
}

import 'package:flutter/material.dart';

enum ThemeType {
  darkMode, // Event for toggling to dark theme
  lightMode, // Event for toggling to light theme
  system, // Event for toggling to system theme
}

extension ThemeTypeDetails on ThemeType {
  String get themeName {
    switch (this) {
      case ThemeType.darkMode:
        return "Dark";
      case ThemeType.lightMode:
        return "Light";
      case ThemeType.system:
        return "System";
    }
  }

  IconData get iconData {
    switch (this) {
      case ThemeType.darkMode:
        return Icons.dark_mode;
      case ThemeType.lightMode:
        return Icons.light_mode;
      case ThemeType.system:
        return Icons.sync_sharp;
    }
  }
}

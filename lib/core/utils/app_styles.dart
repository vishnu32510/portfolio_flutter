import 'package:flutter/material.dart';

class AppStyles {
  AppStyles._();

  // Extra Small
  static TextStyle extraSmallText({Color? textColor}) => TextStyle(
        fontSize: 10,
        color: textColor,
      );

  static TextStyle extraSmallTextThin({Color? textColor}) =>
      TextStyle(fontSize: 10, color: textColor, fontWeight: FontWeight.w200);

  static TextStyle extraSmallTextBold({Color? textColor}) => TextStyle(
        fontSize: 10,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  // Small
  static TextStyle smallText({Color? textColor}) => TextStyle(
        fontSize: 12,
        color: textColor,
      );

  static TextStyle smallTextBold({Color? textColor}) => TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle smallTextThin({Color? textColor}) => TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w200,
      );

  static TextStyle smallRegularText({Color? textColor}) => TextStyle(
        fontSize: 13,
        color: textColor,
      );

  static TextStyle smallRegularTextBold({Color? textColor}) => TextStyle(
        fontSize: 13,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  // Regular
  static TextStyle regularText({Color? textColor}) => TextStyle(
        fontSize: 14,
        color: textColor,
      );

  static TextStyle regularTextBold({Color? textColor}) => TextStyle(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle regularTextItalics({Color? textColor}) => TextStyle(
        fontSize: 14,
        color: textColor,
        fontStyle: FontStyle.italic,
      );

  // Medium
  static TextStyle mediumText({Color? textColor}) => TextStyle(
        fontSize: 16,
        color: textColor,
      );

  static TextStyle mediumTextBold({Color? textColor}) => TextStyle(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  // Large
  static TextStyle largeText({Color? textColor}) => TextStyle(
        fontSize: 18,
        color: textColor,
      );

  static TextStyle largeTextBold({Color? textColor}) => TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  // Extra Large
  static TextStyle extraLargeText({Color? textColor}) => TextStyle(
        fontSize: 20,
        color: textColor,
      );

  static TextStyle extraLargeTextBold({Color? textColor}) => TextStyle(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  // Emphasis & Headlines
  static TextStyle emphasisText({Color? textColor, bool isMobile = false}) =>
      TextStyle(
        fontSize: isMobile ? 35 : 50,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle headlineText({Color? textColor, bool isMobile = false}) =>
      TextStyle(
        fontSize: isMobile ? 30 : 40,
        color: textColor,
      );

  static TextStyle headlineTextBold({
    Color? textColor,
    bool isMobile = false,
  }) =>
      TextStyle(
        fontSize: isMobile ? 30 : 40,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle subText({Color? textColor, bool isMobile = false}) =>
      TextStyle(
        fontSize: isMobile ? 14 : 16,
        color: textColor,
      );

  // Legacy support
  static TextStyle get s52 => const TextStyle(
        fontSize: 52,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get s32 => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get s28 => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get s24 => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get s18 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get s17 => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get s16 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get s14 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get italic => const TextStyle(
        fontSize: 12,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w100,
      );
}

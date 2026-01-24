import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  AppStyles._();

  // Extra Small
  static TextStyle extraSmallText({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 10,
        color: textColor,
      );

  static TextStyle extraSmallTextThin({Color? textColor}) =>
      GoogleFonts.outfit(fontSize: 10, color: textColor, fontWeight: FontWeight.w200);

  static TextStyle extraSmallTextBold({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 10,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  // Small
  static TextStyle smallText({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 12,
        color: textColor,
      );

  static TextStyle smallTextBold({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle smallTextThin({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w200,
      );

  static TextStyle smallRegularText({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 13,
        color: textColor,
      );

  static TextStyle smallRegularTextBold({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 13,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  // Regular
  static TextStyle regularText({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 14,
        color: textColor,
      );

  static TextStyle regularTextBold({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle regularTextItalics({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 14,
        color: textColor,
        fontStyle: FontStyle.italic,
      );

  // Medium
  static TextStyle mediumText({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 16,
        color: textColor,
      );

  static TextStyle mediumTextBold({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  // Large
  static TextStyle largeText({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 18,
        color: textColor,
      );

  static TextStyle largeTextBold({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  // Extra Large
  static TextStyle extraLargeText({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 20,
        color: textColor,
      );

  static TextStyle extraLargeTextBold({Color? textColor}) => GoogleFonts.outfit(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  // Emphasis & Headlines
  static TextStyle emphasisText({Color? textColor, bool isMobile = false}) =>
      GoogleFonts.outfit(
        fontSize: isMobile ? 35 : 50,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle headlineText({Color? textColor, bool isMobile = false}) =>
      GoogleFonts.outfit(
        fontSize: isMobile ? 30 : 40,
        color: textColor,
      );

  static TextStyle headlineTextBold({
    Color? textColor,
    bool isMobile = false,
  }) =>
      GoogleFonts.outfit(
        fontSize: isMobile ? 30 : 40,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle subText({Color? textColor, bool isMobile = false}) =>
      GoogleFonts.outfit(
        fontSize: isMobile ? 14 : 16,
        color: textColor,
      );

  // Legacy support
  static TextStyle get s52 => GoogleFonts.outfit(
        fontSize: 52,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get s32 => GoogleFonts.outfit(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get s28 => GoogleFonts.outfit(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get s24 => GoogleFonts.outfit(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get s18 => GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get s17 => GoogleFonts.outfit(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get s16 => GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get s14 => GoogleFonts.outfit(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get italic => GoogleFonts.outfit(
        fontSize: 12,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w100,
      );
}

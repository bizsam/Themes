import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  const AppTypography._();

  static TextTheme textTheme(Color color) {
    final display = GoogleFonts.playfairDisplay;
    final sans = GoogleFonts.inter;
    final monoAccent = GoogleFonts.dmSans;

    return TextTheme(
      displayLarge: display(
        fontSize: 54,
        fontWeight: FontWeight.w700,
        height: 1.05,
        letterSpacing: -0.8,
        color: color,
      ),
      displayMedium: display(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        height: 1.08,
        letterSpacing: -0.6,
        color: color,
      ),
      displaySmall: display(
        fontSize: 34,
        fontWeight: FontWeight.w600,
        height: 1.1,
        letterSpacing: -0.4,
        color: color,
      ),
      headlineLarge: display(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: color,
      ),
      headlineMedium: display(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        height: 1.2,
        color: color,
      ),
      titleLarge: sans(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0.2,
        color: color,
      ),
      titleMedium: sans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: color,
      ),
      titleSmall: sans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: color,
      ),
      bodyLarge: sans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.65,
        color: color,
      ),
      bodyMedium: sans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: color,
      ),
      bodySmall: sans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: color,
      ),
      labelLarge: monoAccent(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
        color: color,
      ),
      labelMedium: monoAccent(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.6,
        color: color,
      ),
    );
  }
}

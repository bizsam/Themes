import 'package:flutter/material.dart';
import '../../app/theme_controller.dart';
import 'color_palettes.dart';
import 'motion.dart';
import 'radius.dart';
import 'theme_extensions.dart';
import 'typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData fromMood(AppMood mood) {
    switch (mood) {
      case AppMood.warmEditorial:
        return _buildTheme(MoodPalette.warmEditorial, Brightness.light);
      case AppMood.nordicMinimal:
        return _buildTheme(MoodPalette.nordicMinimal, Brightness.light);
      case AppMood.darkCinematic:
        return _buildTheme(MoodPalette.darkCinematic, Brightness.dark);
      case AppMood.vibrantArtistic:
        return _buildTheme(MoodPalette.vibrantArtistic, Brightness.light);
    }
  }

  static ThemeData _buildTheme(MoodPalette palette, Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: palette.seed,
      brightness: brightness,
      primary: palette.primary,
      secondary: palette.secondary,
      tertiary: palette.accent,
      surface: palette.surface,
      error: palette.error,
      outline: palette.outline,
    );

    final textTheme = AppTypography.textTheme(palette.onSurface);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: palette.surface,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: palette.surface,
        foregroundColor: palette.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardTheme(
        color: palette.surfaceAlt,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.card),
        margin: EdgeInsets.zero,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          shape: const StadiumBorder(),
          textStyle: textTheme.labelLarge,
          animationDuration: AppMotion.fast,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: palette.onSurface,
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: palette.surfaceAlt,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: palette.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: palette.primary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
      extensions: [
        MoodTokens(
          gradient: LinearGradient(
            colors: [palette.primary, palette.secondary, palette.accent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          panelGradient: LinearGradient(
            colors: [palette.surfaceAlt, palette.surface],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          success: palette.success,
          warning: palette.warning,
          info: palette.accent,
          surfaceTint: palette.seed.withOpacity(0.12),
          ambientGlow: palette.accent.withOpacity(0.3),
          moodName: palette.name,
          cardShadow: [
            BoxShadow(
              color: palette.seed.withOpacity(0.08),
              blurRadius: 30,
              offset: const Offset(0, 16),
            ),
          ],
        ),
      ],
    );
  }
}

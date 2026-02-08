import 'package:flutter/material.dart';
import 'color_palettes.dart';
import 'motion.dart';
import 'radius.dart';
import 'theme_extensions.dart';
import 'typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() => _buildTheme(AppColorPalettes.fintech, Brightness.light);
  static ThemeData dark() => _buildTheme(AppColorPalettes.darkLuxury, Brightness.dark);
  static ThemeData altBrand() => _buildTheme(AppColorPalettes.pastelPremium, Brightness.light);

  static ThemeData _buildTheme(AppColorPalettes palette, Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: palette.seed,
      brightness: brightness,
      primary: palette.primary,
      secondary: palette.secondary,
      tertiary: palette.tertiary,
      surface: palette.surface,
      error: palette.error,
      outline: palette.outline,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: palette.surface,
      textTheme: AppTypography.textTheme(palette.onSurface),
      appBarTheme: AppBarTheme(
        backgroundColor: palette.surface,
        foregroundColor: palette.onSurface,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardTheme(
        color: palette.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.card),
        margin: EdgeInsets.zero,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: const StadiumBorder(),
          textStyle: AppTypography.textTheme(palette.onSurface).labelLarge,
          animationDuration: AppMotion.fast,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: palette.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: palette.primary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      ),
      extensions: [
        BrandTokens(
          gradient: LinearGradient(
            colors: [palette.primary, palette.secondary, palette.tertiary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          success: palette.success,
          warning: palette.warning,
          info: palette.accent,
          surfaceTint: palette.seed.withOpacity(0.12),
          cardShadow: [
            BoxShadow(
              color: palette.seed.withOpacity(0.08),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
      ],
    );
  }
}

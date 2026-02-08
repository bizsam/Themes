import 'package:flutter/material.dart';

class AppColorPalettes {
  const AppColorPalettes({
    required this.seed,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.surface,
    required this.onSurface,
    required this.accent,
    required this.success,
    required this.warning,
    required this.error,
    required this.outline,
  });

  final Color seed;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color surface;
  final Color onSurface;
  final Color accent;
  final Color success;
  final Color warning;
  final Color error;
  final Color outline;

  static const fintech = AppColorPalettes(
    seed: Color(0xFF0B2B45),
    primary: Color(0xFF0E5A7A),
    secondary: Color(0xFF1BA784),
    tertiary: Color(0xFF6EE7B7),
    surface: Color(0xFFF5F7FB),
    onSurface: Color(0xFF0F172A),
    accent: Color(0xFF8ED4FF),
    success: Color(0xFF12B981),
    warning: Color(0xFFF59E0B),
    error: Color(0xFFEF4444),
    outline: Color(0xFFCBD5E1),
  );

  static const darkLuxury = AppColorPalettes(
    seed: Color(0xFF0E0B14),
    primary: Color(0xFF6D5DFE),
    secondary: Color(0xFFBFA8FF),
    tertiary: Color(0xFF2DD4BF),
    surface: Color(0xFF12101A),
    onSurface: Color(0xFFEDE9FE),
    accent: Color(0xFFFFD166),
    success: Color(0xFF22C55E),
    warning: Color(0xFFFBBF24),
    error: Color(0xFFF87171),
    outline: Color(0xFF2A2536),
  );

  static const pastelPremium = AppColorPalettes(
    seed: Color(0xFFF9B7C9),
    primary: Color(0xFFE76F8A),
    secondary: Color(0xFF6F61FF),
    tertiary: Color(0xFF5BD6C6),
    surface: Color(0xFFFFFBFD),
    onSurface: Color(0xFF2A1F2C),
    accent: Color(0xFFFFC9DE),
    success: Color(0xFF29B57B),
    warning: Color(0xFFFF9F1C),
    error: Color(0xFFF25F5C),
    outline: Color(0xFFE6D9E2),
  );
}

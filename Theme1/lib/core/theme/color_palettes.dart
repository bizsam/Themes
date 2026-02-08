import 'package:flutter/material.dart';

class MoodPalette {
  const MoodPalette({
    required this.name,
    required this.seed,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.surface,
    required this.surfaceAlt,
    required this.onSurface,
    required this.onSurfaceMuted,
    required this.outline,
    required this.success,
    required this.warning,
    required this.error,
  });

  final String name;
  final Color seed;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color surface;
  final Color surfaceAlt;
  final Color onSurface;
  final Color onSurfaceMuted;
  final Color outline;
  final Color success;
  final Color warning;
  final Color error;

  static const warmEditorial = MoodPalette(
    name: 'Warm Editorial',
    seed: Color(0xFF8A533A),
    primary: Color(0xFFBF6B44),
    secondary: Color(0xFFD6A17A),
    accent: Color(0xFFFFC6A8),
    surface: Color(0xFFFFF7F1),
    surfaceAlt: Color(0xFFF4E8DE),
    onSurface: Color(0xFF2C1B16),
    onSurfaceMuted: Color(0xFF6E4E40),
    outline: Color(0xFFE2CFC2),
    success: Color(0xFF4B8466),
    warning: Color(0xFFC8793D),
    error: Color(0xFFB24A3A),
  );

  static const nordicMinimal = MoodPalette(
    name: 'Nordic Minimal',
    seed: Color(0xFF3E5662),
    primary: Color(0xFF3F5E6B),
    secondary: Color(0xFF9BB2B2),
    accent: Color(0xFFDDE4E3),
    surface: Color(0xFFF7F8F9),
    surfaceAlt: Color(0xFFE5EAEB),
    onSurface: Color(0xFF1B252A),
    onSurfaceMuted: Color(0xFF5C6C73),
    outline: Color(0xFFD0D9DB),
    success: Color(0xFF3F7D74),
    warning: Color(0xFFB38B4E),
    error: Color(0xFFB05C5C),
  );

  static const darkCinematic = MoodPalette(
    name: 'Dark Cinematic',
    seed: Color(0xFF0C0B12),
    primary: Color(0xFF8B6CFF),
    secondary: Color(0xFF3F8CFF),
    accent: Color(0xFFEEB868),
    surface: Color(0xFF0F1016),
    surfaceAlt: Color(0xFF1A1C24),
    onSurface: Color(0xFFF4F0FF),
    onSurfaceMuted: Color(0xFFA6A1C5),
    outline: Color(0xFF2A2B36),
    success: Color(0xFF4CD4A0),
    warning: Color(0xFFF4B860),
    error: Color(0xFFF06B6B),
  );

  static const vibrantArtistic = MoodPalette(
    name: 'Vibrant Artistic',
    seed: Color(0xFF6B2DFF),
    primary: Color(0xFF6B2DFF),
    secondary: Color(0xFF00B3FF),
    accent: Color(0xFFFF6B9A),
    surface: Color(0xFFFFFBFF),
    surfaceAlt: Color(0xFFF1ECFF),
    onSurface: Color(0xFF22142F),
    onSurfaceMuted: Color(0xFF5B3E72),
    outline: Color(0xFFE0D6F0),
    success: Color(0xFF3FAE80),
    warning: Color(0xFFEF9A3B),
    error: Color(0xFFE4575C),
  );
}

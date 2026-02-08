import 'package:flutter/material.dart';

@immutable
class MoodTokens extends ThemeExtension<MoodTokens> {
  const MoodTokens({
    required this.gradient,
    required this.panelGradient,
    required this.success,
    required this.warning,
    required this.info,
    required this.cardShadow,
    required this.surfaceTint,
    required this.ambientGlow,
    required this.moodName,
  });

  final LinearGradient gradient;
  final LinearGradient panelGradient;
  final Color success;
  final Color warning;
  final Color info;
  final List<BoxShadow> cardShadow;
  final Color surfaceTint;
  final Color ambientGlow;
  final String moodName;

  @override
  MoodTokens copyWith({
    LinearGradient? gradient,
    LinearGradient? panelGradient,
    Color? success,
    Color? warning,
    Color? info,
    List<BoxShadow>? cardShadow,
    Color? surfaceTint,
    Color? ambientGlow,
    String? moodName,
  }) {
    return MoodTokens(
      gradient: gradient ?? this.gradient,
      panelGradient: panelGradient ?? this.panelGradient,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      cardShadow: cardShadow ?? this.cardShadow,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      ambientGlow: ambientGlow ?? this.ambientGlow,
      moodName: moodName ?? this.moodName,
    );
  }

  @override
  MoodTokens lerp(ThemeExtension<MoodTokens>? other, double t) {
    if (other is! MoodTokens) return this;
    return MoodTokens(
      gradient: LinearGradient.lerp(gradient, other.gradient, t) ?? gradient,
      panelGradient: LinearGradient.lerp(panelGradient, other.panelGradient, t) ?? panelGradient,
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      info: Color.lerp(info, other.info, t) ?? info,
      cardShadow: List<BoxShadow>.from(other.cardShadow),
      surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t) ?? surfaceTint,
      ambientGlow: Color.lerp(ambientGlow, other.ambientGlow, t) ?? ambientGlow,
      moodName: other.moodName,
    );
  }
}

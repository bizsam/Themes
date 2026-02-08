import 'package:flutter/material.dart';

@immutable
class BrandTokens extends ThemeExtension<BrandTokens> {
  const BrandTokens({
    required this.gradient,
    required this.success,
    required this.warning,
    required this.info,
    required this.cardShadow,
    required this.surfaceTint,
  });

  final LinearGradient gradient;
  final Color success;
  final Color warning;
  final Color info;
  final List<BoxShadow> cardShadow;
  final Color surfaceTint;

  @override
  BrandTokens copyWith({
    LinearGradient? gradient,
    Color? success,
    Color? warning,
    Color? info,
    List<BoxShadow>? cardShadow,
    Color? surfaceTint,
  }) {
    return BrandTokens(
      gradient: gradient ?? this.gradient,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      cardShadow: cardShadow ?? this.cardShadow,
      surfaceTint: surfaceTint ?? this.surfaceTint,
    );
  }

  @override
  BrandTokens lerp(ThemeExtension<BrandTokens>? other, double t) {
    if (other is! BrandTokens) return this;
    return BrandTokens(
      gradient: LinearGradient.lerp(gradient, other.gradient, t) ?? gradient,
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      info: Color.lerp(info, other.info, t) ?? info,
      cardShadow: List<BoxShadow>.from(other.cardShadow),
      surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t) ?? surfaceTint,
    );
  }
}

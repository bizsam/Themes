import 'package:flutter/animation.dart';

class AppMotion {
  const AppMotion._();

  static const Duration fast = Duration(milliseconds: 180);
  static const Duration medium = Duration(milliseconds: 320);
  static const Duration slow = Duration(milliseconds: 520);

  static const Curve emphasized = Curves.easeOutCubic;
  static const Curve standard = Curves.easeInOut;
  static const Curve entrance = Curves.easeOutBack;
  static const Curve exit = Curves.easeInQuad;
}

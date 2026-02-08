import 'package:flutter/material.dart';

class MoodHaloPainter extends CustomPainter {
  MoodHaloPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color.withOpacity(0.35), color.withOpacity(0.0)],
      ).createShader(Rect.fromCircle(center: Offset(size.width * 0.3, size.height * 0.2), radius: size.width));

    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.15), size.width * 0.6, paint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.6), size.width * 0.5, paint);
  }

  @override
  bool shouldRepaint(covariant MoodHaloPainter oldDelegate) => oldDelegate.color != color;
}

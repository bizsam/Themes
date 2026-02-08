import 'package:flutter/material.dart';
import '../theme/spacing.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    super.key,
    required this.child,
  });

  final Widget child;

  double _horizontalPadding(double width) {
    if (width >= 1200) return AppSpacing.xxxl;
    if (width >= 900) return AppSpacing.xxl;
    if (width >= 600) return AppSpacing.xl;
    return AppSpacing.lg;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: _horizontalPadding(constraints.maxWidth)),
          child: child,
        );
      },
    );
  }
}

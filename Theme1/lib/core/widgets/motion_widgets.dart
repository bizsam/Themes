import 'package:flutter/material.dart';
import '../theme/motion.dart';

class RevealOnScroll extends StatefulWidget {
  const RevealOnScroll({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.axisOffset = 24,
  });

  final Widget child;
  final Duration delay;
  final double axisOffset;

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: AppMotion.slow,
  );
  late final Animation<double> _opacity = CurvedAnimation(
    parent: _controller,
    curve: AppMotion.emphasized,
  );
  late final Animation<Offset> _offset = Tween<Offset>(
    begin: Offset(0, widget.axisOffset / 100),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.emphasized));

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _offset,
        child: widget.child,
      ),
    );
  }
}

class ParallaxLayer extends StatelessWidget {
  const ParallaxLayer({
    super.key,
    required this.offset,
    required this.child,
    this.rate = 0.25,
  });

  final double offset;
  final double rate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -offset * rate),
      child: child,
    );
  }
}

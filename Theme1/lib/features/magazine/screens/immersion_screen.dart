import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/motion.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../core/widgets/halo_painter.dart';
import '../../../core/widgets/motion_widgets.dart';

class ImmersionScreen extends StatefulWidget {
  const ImmersionScreen({super.key});

  @override
  State<ImmersionScreen> createState() => _ImmersionScreenState();
}

class _ImmersionScreenState extends State<ImmersionScreen> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<MoodTokens>()!;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: tokens.gradient),
          ),
          CustomPaint(
            painter: MoodHaloPainter(color: tokens.ambientGlow),
            child: const SizedBox.expand(),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aurora Atelier', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white70)),
                  const Spacer(),
                  SizedBox(
                    height: 360,
                    child: PageView(
                      controller: _controller,
                      onPageChanged: (value) => setState(() => _pageIndex = value),
                      children: const [
                        _StoryPanel(
                          title: 'A magazine that feels alive.',
                          subtitle: 'Immersive stories shaped by light, texture, and rhythm.',
                        ),
                        _StoryPanel(
                          title: 'Editorial discovery',
                          subtitle: 'Curated collections and mood-driven highlights.',
                        ),
                        _StoryPanel(
                          title: 'Identity, crafted',
                          subtitle: 'Showcase your portfolio with cinematic depth.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Row(
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: AppMotion.medium,
                        margin: const EdgeInsets.only(right: 6),
                        height: 4,
                        width: _pageIndex == index ? 24 : 12,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(_pageIndex == index ? 1 : 0.4),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  RevealOnScroll(
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () => context.go('/discovery'),
                        style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
                        child: const Text('Enter the journal'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryPanel extends StatelessWidget {
  const _StoryPanel({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}

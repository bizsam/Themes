import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/motion.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/app_buttons.dart';

class IntroCarouselScreen extends StatefulWidget {
  const IntroCarouselScreen({super.key});

  @override
  State<IntroCarouselScreen> createState() => _IntroCarouselScreenState();
}

class _IntroCarouselScreenState extends State<IntroCarouselScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  final List<_IntroSlide> _slides = const [
    _IntroSlide(
      title: 'Your money, beautifully organized',
      subtitle: 'Track spend, grow savings, and discover insights powered by real-time signals.',
      icon: Icons.auto_graph,
    ),
    _IntroSlide(
      title: 'Trusted by your inner circle',
      subtitle: 'Send secure requests, share goals, and split group expenses with confidence.',
      icon: Icons.people_alt_outlined,
    ),
    _IntroSlide(
      title: 'Premium control on every screen',
      subtitle: 'Personalized cards, smart alerts, and privacy-first settings for modern life.',
      icon: Icons.shield_moon_outlined,
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_index < _slides.length - 1) {
      _controller.nextPage(duration: AppMotion.medium, curve: AppMotion.emphasized);
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Skip'),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _slides.length,
                  onPageChanged: (value) => setState(() => _index = value),
                  itemBuilder: (context, index) {
                    final slide = _slides[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Icon(slide.icon, size: 64, color: Theme.of(context).colorScheme.primary),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        Text(slide.title, style: Theme.of(context).textTheme.headlineLarge),
                        const SizedBox(height: AppSpacing.sm),
                        Text(slide.subtitle, style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: List.generate(
                        _slides.length,
                        (index) => AnimatedContainer(
                          duration: AppMotion.fast,
                          margin: const EdgeInsets.only(right: 8),
                          height: 6,
                          width: _index == index ? 28 : 12,
                          decoration: BoxDecoration(
                            color: _index == index
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.outline,
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  SizedBox(
                    width: 140,
                    child: AppPrimaryButton(
                      label: _index == _slides.length - 1 ? 'Get started' : 'Next',
                      onPressed: _onNext,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}

class _IntroSlide {
  const _IntroSlide({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}

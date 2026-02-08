import 'package:flutter/material.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/motion_widgets.dart';
import '../../../core/widgets/editorial_scaffold.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final ScrollController _controller = ScrollController();
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() => _offset = _controller.offset));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EditorialScaffold(
      showSafeArea: false,
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 360,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ParallaxLayer(
                      offset: _offset,
                      rate: 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.secondary,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: AppSpacing.xl,
                    right: AppSpacing.xl,
                    bottom: AppSpacing.xl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Velvet Nightfall',
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'A cinematic editorial on nocturnal textures and muted light.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xl),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  RevealOnScroll(
                    child: Text(
                      'The atelier goes quiet as the city exhales. Velvet textures, glass reflections, and soundless silhouettes define a new rhythm for the night.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  RevealOnScroll(
                    delay: const Duration(milliseconds: 120),
                    child: _MediaBlock(),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  RevealOnScroll(
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      'Each frame is layered with a deliberate absence, giving space to the material story. Drapes fall, the floor glows, and the narrative reveals itself slowly.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  RevealOnScroll(
                    delay: const Duration(milliseconds: 260),
                    child: _QuoteBlock(),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  RevealOnScroll(
                    delay: const Duration(milliseconds: 320),
                    child: Text(
                      'The final edit is a palette of near-black blues and soft rose highlights, designed to linger like a slow exposure.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MediaBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 84,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Container(
                height: 84,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuoteBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Text(
        '“We wanted the story to feel like a whisper—something you lean into rather than scroll past.”',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../core/widgets/editorial_card.dart';
import '../../../core/widgets/editorial_scaffold.dart';
import '../../../core/widgets/motion_widgets.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<MoodTokens>()!;
    return EditorialScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.lg),
            Text('Discovery', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: AppSpacing.sm),
            Text('Curated stories, intimate collections, bold imagery.', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: AppSpacing.xl),
            RevealOnScroll(
              child: EditorialCard(
                tag: 'Feature',
                title: 'The Atelier Issue',
                subtitle: 'Layered textures, bespoke silhouettes, and the artistry behind them.',
                onTap: () => context.go('/content'),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Highlights', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _HighlightCard(
                    title: 'Studio Visits',
                    subtitle: '8 new ateliers',
                    color: tokens.gradient,
                  ),
                  _HighlightCard(
                    title: 'Moodboards',
                    subtitle: 'New palettes',
                    color: LinearGradient(colors: [tokens.info, tokens.warning]),
                  ),
                  _HighlightCard(
                    title: 'Collections',
                    subtitle: '32 editorial sets',
                    color: LinearGradient(colors: [tokens.success, tokens.ambientGlow]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Collections', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            _CollectionRow(title: 'Velvet Nights', count: '12 stories'),
            _CollectionRow(title: 'Minimal North', count: '9 stories'),
            _CollectionRow(title: 'Chromatic Echoes', count: '16 stories'),
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: () => context.go('/dashboards'),
              child: const Text('Open dashboards'),
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  const _HighlightCard({required this.title, required this.subtitle, required this.color});

  final String title;
  final String subtitle;
  final Gradient color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
          const Spacer(),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70)),
        ],
      ),
    );
  }
}

class _CollectionRow extends StatelessWidget {
  const _CollectionRow({required this.title, required this.count});

  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(count, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}

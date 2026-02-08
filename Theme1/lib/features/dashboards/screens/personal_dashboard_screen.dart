import 'package:flutter/material.dart';
import '../../../core/theme/radius.dart';
import '../../../core/theme/spacing.dart';
import '../data/dashboard_data.dart';

class PersonalDashboardScreen extends StatelessWidget {
  const PersonalDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Rituals', style: textTheme.displaySmall),
          const SizedBox(height: AppSpacing.sm),
          Text('Your creative cadence and private insights.', style: textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.xl),
          _InsightRing(progress: 0.74, label: 'Streak', value: '18 days'),
          const SizedBox(height: AppSpacing.lg),
          Text('Goals', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Column(
            children: DashboardMockData.personalGoals
                .map(
                  (goal) => Container(
                    margin: const EdgeInsets.only(bottom: AppSpacing.md),
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      borderRadius: AppRadius.card,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Row(
                      children: [
                        CircularProgressIndicator(
                          value: goal.progress,
                          strokeWidth: 6,
                          color: Theme.of(context).colorScheme.primary,
                          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(goal.title, style: textTheme.titleMedium),
                              const SizedBox(height: 4),
                              Text(goal.detail, style: textTheme.bodySmall),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Recommendations', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              borderRadius: AppRadius.card,
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Listen to “Velvet City”', style: textTheme.titleMedium),
                const SizedBox(height: 6),
                Text('A sonic palette curated for late-night editing.', style: textTheme.bodySmall),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.play_arrow, color: Colors.white),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Text('34 min', style: textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InsightRing extends StatelessWidget {
  const _InsightRing({required this.progress, required this.label, required this.value});

  final double progress;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppRadius.card,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 8,
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                Center(
                  child: Text('${(progress * 100).round()}%', style: Theme.of(context).textTheme.titleMedium),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label.toUpperCase(), style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: 6),
              Text(value, style: Theme.of(context).textTheme.headlineLarge),
            ],
          ),
        ],
      ),
    );
  }
}

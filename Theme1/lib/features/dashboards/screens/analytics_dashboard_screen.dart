import 'package:flutter/material.dart';
import '../../../core/theme/radius.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/theme_extensions.dart';
import '../data/dashboard_data.dart';

class AnalyticsDashboardScreen extends StatelessWidget {
  const AnalyticsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<MoodTokens>()!;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Analytics Atelier', style: textTheme.displaySmall),
          const SizedBox(height: AppSpacing.sm),
          Text('Signals, tempo, and cultural resonance.', style: textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.xl),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: DashboardMockData.analyticsKpis
                .map(
                  (kpi) => Container(
                    width: 170,
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: AppRadius.card,
                      boxShadow: tokens.cardShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kpi.label.toUpperCase(), style: textTheme.labelMedium),
                        const SizedBox(height: AppSpacing.sm),
                        Text(kpi.value, style: textTheme.headlineLarge),
                        const SizedBox(height: 4),
                        Text(kpi.delta, style: textTheme.bodySmall?.copyWith(color: tokens.success)),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppSpacing.xl),
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              gradient: tokens.gradient,
              borderRadius: AppRadius.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Trendline', style: textTheme.titleMedium?.copyWith(color: Colors.white)),
                const SizedBox(height: AppSpacing.sm),
                Text('Engagement is peaking every Friday night.', style: textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    _ChartPill(label: '12W', isActive: true),
                    const SizedBox(width: AppSpacing.sm),
                    _ChartPill(label: '6M'),
                    const SizedBox(width: AppSpacing.sm),
                    _ChartPill(label: '1Y'),
                    const Spacer(),
                    Text('Export', style: textTheme.labelLarge?.copyWith(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                SizedBox(
                  height: 140,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(
                      10,
                      (index) {
                        final height = 40.0 + (index % 4) * 20.0;
                        return Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: height,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text('Filters', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            children: const [
              _FilterChip(label: 'Regions'),
              _FilterChip(label: 'Audience'),
              _FilterChip(label: 'Channels'),
              _FilterChip(label: 'Editorial'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChartPill extends StatelessWidget {
  const _ChartPill({required this.label, this.isActive = false});

  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white24,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: isActive ? Colors.black : Colors.white,
            ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
    );
  }
}

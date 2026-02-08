import 'package:flutter/material.dart';
import '../../../core/theme/radius.dart';
import '../../../core/theme/spacing.dart';
import '../data/dashboard_data.dart';

class ActivityDashboardScreen extends StatelessWidget {
  const ActivityDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Activity Studio', style: textTheme.displaySmall),
          const SizedBox(height: AppSpacing.sm),
          Text('Everything in motion, beautifully orchestrated.', style: textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.lg),
          _ActivityCard(
            title: 'Notifications hub',
            subtitle: '3 new collaborations · 2 editorial notes',
            icon: Icons.notifications,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Timeline', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Column(
            children: DashboardMockData.activityTimeline
                .map(
                  (entry) => Container(
                    margin: const EdgeInsets.only(bottom: AppSpacing.md),
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: AppRadius.card,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 2,
                              height: 60,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ],
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(entry.time, style: textTheme.labelMedium),
                              const SizedBox(height: 4),
                              Text(entry.title, style: textTheme.titleMedium),
                              const SizedBox(height: 4),
                              Text(entry.detail, style: textTheme.bodySmall),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                          ),
                          child: Text(entry.status, style: textTheme.labelMedium),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Tasks', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: const [
              Expanded(child: _TaskChip(label: 'Finalize covers')),
              SizedBox(width: AppSpacing.sm),
              Expanded(child: _TaskChip(label: 'Confirm cast')),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({required this.title, required this.subtitle, required this.icon});

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: AppRadius.card,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}

class _TaskChip extends StatelessWidget {
  const _TaskChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}

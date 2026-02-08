import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/app_config.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/theme_extensions.dart';
import '../dashboard_registry.dart';

class DashboardShellScreen extends ConsumerWidget {
  const DashboardShellScreen({super.key, required this.dashboardId});

  final String dashboardId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flags = ref.watch(featureFlagsProvider);
    final role = ref.watch(userRoleProvider);
    final registry = DashboardRegistry(flags);
    final definition = registry.byId(dashboardId);
    final tokens = Theme.of(context).extension<MoodTokens>()!;

    if (definition == null || !definition.allowedRoles.contains(role)) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 48, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: AppSpacing.md),
              Text('This dashboard is unavailable for your role.', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.sm),
              Text('Switch roles or enable it in the feature flags.', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: definition.accent,
      ),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(32),
            boxShadow: tokens.cardShadow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: definition.builder(context),
          ),
        ),
      ),
    );
  }
}

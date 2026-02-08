import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/app_config.dart';
import '../../../core/theme/radius.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../core/models/user_role.dart';
import '../dashboard_registry.dart';

class DashboardHubScreen extends ConsumerWidget {
  const DashboardHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flags = ref.watch(featureFlagsProvider);
    final role = ref.watch(userRoleProvider);
    final registry = DashboardRegistry(flags);
    final dashboards = registry
        .definitions()
        .where((dashboard) => dashboard.allowedRoles.contains(role))
        .toList();
    final tokens = Theme.of(context).extension<MoodTokens>()!;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dashboards', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: AppSpacing.sm),
          Text('Switch between dashboard modes by role or build.', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.xl),
          ...dashboards.map(
            (dashboard) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.lg),
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                borderRadius: AppRadius.card,
                gradient: dashboard.accent,
                boxShadow: tokens.cardShadow,
              ),
              child: Row(
                children: [
                  Icon(dashboard.icon, color: Colors.white, size: 32),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dashboard.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          dashboard.subtitle,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.go('/dashboard/${dashboard.id}'),
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text('Open'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _RoleToggle(role: role),
        ],
      ),
    );
  }
}

class _RoleToggle extends ConsumerWidget {
  const _RoleToggle({required this.role});

  final UserRole role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Role mode', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          children: UserRole.values
              .map(
                (value) => ChoiceChip(
                  label: Text(value.name),
                  selected: role == value,
                  onSelected: (_) => ref.read(userRoleProvider.notifier).state = value,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

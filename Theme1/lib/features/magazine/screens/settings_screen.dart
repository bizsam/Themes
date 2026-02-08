import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/app_config.dart';
import '../../../app/theme_controller.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../core/config/feature_flags.dart';
import '../../../core/widgets/editorial_scaffold.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mood = ref.watch(moodControllerProvider);
    final flags = ref.watch(featureFlagsProvider);
    final tokens = Theme.of(context).extension<MoodTokens>()!;

    return EditorialScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.lg),
            Text('Settings', style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: AppSpacing.sm),
            Text('Mood, dashboards, and editorial preferences.', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: AppSpacing.xl),
            Text('Mood palettes', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: AppMood.values
                  .map(
                    (value) => GestureDetector(
                      onTap: () => ref.read(moodControllerProvider.notifier).setMood(value),
                      child: _MoodTile(
                        mood: value,
                        isActive: mood == value,
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Dashboard modules', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            _FlagToggle(
              label: 'Analytics dashboard',
              value: flags.analyticsDashboard,
              onChanged: (value) => ref.read(featureFlagsProvider.notifier).state =
                  flags.copyWith(analyticsDashboard: value),
            ),
            _FlagToggle(
              label: 'Activity dashboard',
              value: flags.activityDashboard,
              onChanged: (value) => ref.read(featureFlagsProvider.notifier).state =
                  flags.copyWith(activityDashboard: value),
            ),
            _FlagToggle(
              label: 'Personal dashboard',
              value: flags.personalDashboard,
              onChanged: (value) => ref.read(featureFlagsProvider.notifier).state =
                  flags.copyWith(personalDashboard: value),
            ),
            const SizedBox(height: AppSpacing.xl),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                gradient: tokens.gradient,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Theme details', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Active mood: ${tokens.moodName}. Customize typography and spacing in the theme files.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}

class _MoodTile extends StatelessWidget {
  const _MoodTile({required this.mood, required this.isActive});

  final AppMood mood;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final label = switch (mood) {
      AppMood.warmEditorial => 'Warm Editorial',
      AppMood.nordicMinimal => 'Nordic Minimal',
      AppMood.darkCinematic => 'Dark Cinematic',
      AppMood.vibrantArtistic => 'Vibrant Artistic',
    };

    return Container(
      width: 160,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline,
          width: isActive ? 2 : 1,
        ),
      ),
      child: Text(label, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}

class _FlagToggle extends StatelessWidget {
  const _FlagToggle({required this.label, required this.value, required this.onChanged});

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: onChanged,
      title: Text(label, style: Theme.of(context).textTheme.bodyMedium),
      contentPadding: EdgeInsets.zero,
    );
  }
}

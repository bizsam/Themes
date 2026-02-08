import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme_controller.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/section_header.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(moodControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            const SectionHeader(
              title: 'Appearance',
              subtitle: 'Choose the look that matches your mood.',
            ),
            _ThemeOption(
              title: 'Warm editorial',
              subtitle: 'Terracotta light and editorial warmth',
              selected: mode == AppMood.warmEditorial,
              onTap: () => ref.read(moodControllerProvider.notifier).setMood(AppMood.warmEditorial),
            ),
            _ThemeOption(
              title: 'Nordic minimal',
              subtitle: 'Quiet neutrals and spacious layouts',
              selected: mode == AppMood.nordicMinimal,
              onTap: () => ref.read(moodControllerProvider.notifier).setMood(AppMood.nordicMinimal),
            ),
            _ThemeOption(
              title: 'Dark cinematic',
              subtitle: 'Inky shadows and luminous accents',
              selected: mode == AppMood.darkCinematic,
              onTap: () => ref.read(moodControllerProvider.notifier).setMood(AppMood.darkCinematic),
            ),
            _ThemeOption(
              title: 'Vibrant artistic',
              subtitle: 'Electric hues with gallery energy',
              selected: mode == AppMood.vibrantArtistic,
              onTap: () => ref.read(moodControllerProvider.notifier).setMood(AppMood.vibrantArtistic),
            ),
            const SizedBox(height: AppSpacing.xl),
            const SectionHeader(
              title: 'Preferences',
              subtitle: 'Control your daily experience.',
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (_) {},
              title: const Text('Smart notifications'),
              subtitle: const Text('Context-aware alerts and summaries'),
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: false,
              onChanged: (_) {},
              title: const Text('Private balance'),
              subtitle: const Text('Hide totals on shared screens'),
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (_) {},
              title: const Text('Haptic feedback'),
              subtitle: const Text('Subtle feedback for key actions'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: selected
          ? Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary)
          : const Icon(Icons.circle_outlined),
      onTap: onTap,
    );
  }
}

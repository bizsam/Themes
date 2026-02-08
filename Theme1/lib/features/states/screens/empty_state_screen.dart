import 'package:flutter/material.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/app_buttons.dart';

class EmptyStateScreen extends StatelessWidget {
  const EmptyStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.folder_open, size: 80, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: AppSpacing.lg),
                Text('Nothing here yet', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Start by creating your first smart goal or invite your friends.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                AppPrimaryButton(label: 'Create new goal', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

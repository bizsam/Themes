import 'package:flutter/material.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/app_buttons.dart';

class ErrorStateScreen extends StatelessWidget {
  const ErrorStateScreen({super.key});

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
                Icon(Icons.error_outline, size: 80, color: Theme.of(context).colorScheme.error),
                const SizedBox(height: AppSpacing.lg),
                Text('Something went wrong', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'We could not load your insights. Please check your connection and try again.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                AppPrimaryButton(label: 'Try again', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

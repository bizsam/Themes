import 'package:flutter/material.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/app_buttons.dart';

class OfflineStateScreen extends StatelessWidget {
  const OfflineStateScreen({super.key});

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
                Icon(Icons.wifi_off, size: 80, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: AppSpacing.lg),
                Text('You are offline', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Reconnect to continue syncing balances, alerts, and messages.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                AppPrimaryButton(label: 'Retry connection', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

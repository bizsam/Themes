import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/app_buttons.dart';
import '../../../core/widgets/section_header.dart';

class OtpResetScreen extends StatelessWidget {
  const OtpResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Verify your identity',
                subtitle: 'Enter the 6-digit code sent to your email.',
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: List.generate(
                  6,
                  (index) => Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: index == 5 ? 0 : AppSpacing.sm),
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      ),
                      child: const Center(
                        child: Text('•', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppPrimaryButton(
                label: 'Confirm & continue',
                onPressed: () => context.go('/home'),
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextButton(
                label: 'Resend code',
                onPressed: () {},
              ),
              const Spacer(),
              Text(
                'Need help? Reach out to support@aurora.app',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

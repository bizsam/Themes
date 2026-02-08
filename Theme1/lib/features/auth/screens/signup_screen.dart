import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/app_buttons.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/section_header.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Create your Aurora account',
                subtitle: 'Build your premium wallet and social profile in minutes.',
              ),
              const SizedBox(height: AppSpacing.lg),
              const AppTextField(
                label: 'Full name',
                hint: 'Avery Chen',
              ),
              const SizedBox(height: AppSpacing.md),
              const AppTextField(
                label: 'Email',
                hint: 'you@aurora.app',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: AppSpacing.md),
              const AppTextField(
                label: 'Password',
                hint: 'Create a secure password',
                obscureText: true,
              ),
              const SizedBox(height: AppSpacing.md),
              const AppTextField(
                label: 'Referral code (optional)',
                hint: 'AURORA-2025',
              ),
              const SizedBox(height: AppSpacing.lg),
              AppPrimaryButton(
                label: 'Create account',
                onPressed: () => context.go('/otp'),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'By continuing you agree to our Terms and Privacy.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: AppSpacing.xl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => context.go('/login'),
                    child: const Text('Sign in'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/app_buttons.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/section_header.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit profile')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Identity details',
                subtitle: 'Keep your profile up to date for a tailored experience.',
              ),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 44,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: const Text('AC', style: TextStyle(color: Colors.white, fontSize: 22)),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainerHighest,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt, size: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              const AppTextField(label: 'Full name', hint: 'Avery Chen'),
              const SizedBox(height: AppSpacing.md),
              const AppTextField(label: 'Username', hint: '@avery'),
              const SizedBox(height: AppSpacing.md),
              const AppTextField(label: 'Email', hint: 'you@aurora.app'),
              const SizedBox(height: AppSpacing.md),
              const AppTextField(label: 'Bio', hint: 'Fintech lover · Travel curator · Growth mindset'),
              const SizedBox(height: AppSpacing.xl),
              AppPrimaryButton(label: 'Save changes', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/responsive_padding.dart';
import '../../../core/widgets/section_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        child: ResponsivePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 34,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: const Text('AC', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Avery Chen', style: Theme.of(context).textTheme.headlineMedium),
                      Text('Premium member', style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              const SectionHeader(
                title: 'Profile',
                subtitle: 'Manage your identity and preferences.',
              ),
              _ProfileTile(
                title: 'Edit profile',
                subtitle: 'Personal details, avatar, bio',
                icon: Icons.edit_outlined,
                onTap: () => context.go('/edit-profile'),
              ),
              _ProfileTile(
                title: 'Settings',
                subtitle: 'Theme, notifications, language',
                icon: Icons.settings_outlined,
                onTap: () => context.go('/settings'),
              ),
              _ProfileTile(
                title: 'Security',
                subtitle: 'Passcode, biometrics, trusted devices',
                icon: Icons.shield_outlined,
                onTap: () => context.go('/security'),
              ),
              const SizedBox(height: AppSpacing.xl),
              const SectionHeader(
                title: 'Membership',
                subtitle: 'Premium perks and benefits.',
              ),
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Aurora Black', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 6),
                    Text('Metal card, concierge, and early access to new features.',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: AppSpacing.md),
                    FilledButton(
                      onPressed: () {},
                      child: const Text('View benefits'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Icon(icon, color: Theme.of(context).colorScheme.primary),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

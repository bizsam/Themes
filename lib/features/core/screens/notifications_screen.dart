import 'package:flutter/material.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/responsive_padding.dart';
import '../../../core/widgets/section_header.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ResponsivePadding(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Notifications',
                subtitle: 'Real-time alerts curated for you.',
              ),
              Expanded(
                child: ListView(
                  children: const [
                    _NotificationTile(
                      title: 'Card used at Lune Studio',
                      subtitle: 'A\$64.20 · 2 min ago',
                      icon: Icons.credit_card,
                    ),
                    _NotificationTile(
                      title: 'New goal milestone',
                      subtitle: 'Santorini trip reached 60%',
                      icon: Icons.flag_outlined,
                    ),
                    _NotificationTile(
                      title: 'Security check',
                      subtitle: 'New sign-in from Melbourne',
                      icon: Icons.shield_outlined,
                    ),
                    _NotificationTile(
                      title: 'Social update',
                      subtitle: 'Jules sent you a split request',
                      icon: Icons.chat_bubble_outline,
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

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Icon(icon, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

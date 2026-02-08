import 'package:flutter/material.dart';
import '../theme/radius.dart';
import '../theme/spacing.dart';
import '../theme/theme_extensions.dart';

class EditorialCard extends StatelessWidget {
  const EditorialCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tag,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String tag;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<MoodTokens>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          gradient: tokens.gradient,
          borderRadius: AppRadius.card,
          boxShadow: tokens.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tag.toUpperCase(), style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white70)),
            const SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

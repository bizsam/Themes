import 'package:flutter/material.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/responsive_padding.dart';
import '../../../core/widgets/section_header.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                title: 'Search',
                subtitle: 'Find people, payments, or insights.',
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search transactions, contacts, or features',
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text('Suggested', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: const [
                  _SearchChip(label: 'Subscriptions'),
                  _SearchChip(label: 'Shared goals'),
                  _SearchChip(label: 'Travel budget'),
                  _SearchChip(label: 'Crypto insights'),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              Text('Recent', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.md),
              const _RecentSearch(title: 'Café Milano', subtitle: 'Dining · \$28.40'),
              const _RecentSearch(title: 'Horizon Savings', subtitle: 'Goals · \$4,200'),
              const _RecentSearch(title: 'Sophia Park', subtitle: 'Contact · Split bill'),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchChip extends StatelessWidget {
  const _SearchChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      side: BorderSide.none,
    );
  }
}

class _RecentSearch extends StatelessWidget {
  const _RecentSearch({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Icon(Icons.history, color: Theme.of(context).colorScheme.primary),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

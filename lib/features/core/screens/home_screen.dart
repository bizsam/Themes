import 'package:flutter/material.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../core/widgets/responsive_padding.dart';
import '../../../core/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brand = Theme.of(context).extension<BrandTokens>()!;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        child: ResponsivePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good morning, Avery', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text('Premium wallet', style: Theme.of(context).textTheme.headlineLarge),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: const Text('AC', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  gradient: brand.gradient,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: brand.cardShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total balance', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
                    const SizedBox(height: 6),
                    Text('\$24,820.40', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white)),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _BalanceChip(label: 'Growth', value: '+12.4%'),
                        _BalanceChip(label: 'Cashback', value: '\$840'),
                        _BalanceChip(label: 'Vault', value: '3 goals'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              const SectionHeader(
                title: 'Quick actions',
                subtitle: 'Move faster with curated shortcuts.',
              ),
              Row(
                children: const [
                  _QuickAction(icon: Icons.swap_horiz, label: 'Transfer'),
                  _QuickAction(icon: Icons.qr_code, label: 'Pay'),
                  _QuickAction(icon: Icons.bar_chart, label: 'Invest'),
                  _QuickAction(icon: Icons.request_page_outlined, label: 'Request'),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              const SectionHeader(
                title: 'Insights',
                subtitle: 'Signals tailored to your lifestyle.',
              ),
              _InsightCard(
                title: 'Monthly spend is trending down',
                subtitle: 'Dining expenses dropped by 14% vs last month.',
                icon: Icons.trending_down,
                color: brand.success,
              ),
              const SizedBox(height: AppSpacing.md),
              _InsightCard(
                title: 'Upcoming subscription renewal',
                subtitle: 'Aurora Plus renews on Oct 24 for \$12.99.',
                icon: Icons.calendar_today,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: AppSpacing.sm),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 6),
            Text(label, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BalanceChip extends StatelessWidget {
  const _BalanceChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70)),
        const SizedBox(height: 4),
        Text(value, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white)),
      ],
    );
  }
}

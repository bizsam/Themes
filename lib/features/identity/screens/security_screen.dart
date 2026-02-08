import 'package:flutter/material.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/widgets/section_header.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Security')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            const SectionHeader(
              title: 'Account protection',
              subtitle: 'Stay protected with layered security.',
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (_) {},
              title: const Text('Biometric unlock'),
              subtitle: const Text('Face ID or fingerprint required for access'),
            ),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (_) {},
              title: const Text('Transaction approval'),
              subtitle: const Text('Confirm high-value transfers'),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Trusted devices'),
              subtitle: const Text('MacBook Pro · iPhone 15 Pro'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const SizedBox(height: AppSpacing.xl),
            const SectionHeader(
              title: 'Privacy',
              subtitle: 'Control how your data is used.',
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Data permissions'),
              subtitle: const Text('Review connected services'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Download data'),
              subtitle: const Text('Export a copy of your activity'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../theme/spacing.dart';
import '../theme/theme_extensions.dart';

class EditorialScaffold extends StatelessWidget {
  const EditorialScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showSafeArea = true,
  });

  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showSafeArea;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<MoodTokens>()!;
    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: body,
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: tokens.panelGradient,
        ),
        child: showSafeArea ? SafeArea(child: content) : content,
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

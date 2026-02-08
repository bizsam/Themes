import 'package:flutter/material.dart';
import '../../../core/theme/motion.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/theme_extensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brand = Theme.of(context).extension<MoodTokens>()!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: brand.gradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  'Aurora',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Smart money, social energy, premium control.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white70,
                      ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.7,
                        color: Colors.white,
                        backgroundColor: Colors.white24,
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    AnimatedScale(
                      scale: 1,
                      duration: AppMotion.medium,
                      curve: AppMotion.emphasized,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_forward, color: brand.gradient.colors.first),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

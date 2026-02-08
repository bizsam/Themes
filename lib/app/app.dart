import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/theme/app_theme.dart';
import 'router.dart';
import 'theme_controller.dart';

class AuroraApp extends ConsumerWidget {
  const AuroraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final lightTheme = themeMode == AppThemeMode.altBrand
        ? AppTheme.altBrand()
        : AppTheme.light();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Aurora',
      theme: lightTheme,
      darkTheme: AppTheme.dark(),
      themeMode: _mapThemeMode(themeMode),
      routerConfig: appRouter,
    );
  }

  ThemeMode _mapThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.altBrand:
        return ThemeMode.light;
    }
  }
}

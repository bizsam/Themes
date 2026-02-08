import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/theme/app_theme.dart';
import 'router.dart';
import 'theme_controller.dart';

class AuroraApp extends ConsumerWidget {
  const AuroraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mood = ref.watch(moodControllerProvider);
    final theme = AppTheme.fromMood(mood);
    final themeMode = mood == AppMood.darkCinematic ? ThemeMode.dark : ThemeMode.light;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Aurora Atelier',
      theme: theme,
      darkTheme: AppTheme.fromMood(AppMood.darkCinematic),
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}

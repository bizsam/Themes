import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppThemeMode {
  system,
  light,
  dark,
  altBrand,
}

class ThemeController extends StateNotifier<AppThemeMode> {
  ThemeController() : super(AppThemeMode.system);

  void setTheme(AppThemeMode mode) {
    state = mode;
  }
}

final themeControllerProvider = StateNotifierProvider<ThemeController, AppThemeMode>(
  (ref) => ThemeController(),
);

# Aurora Atelier · Customization Guide

## Mood-based theme system
The template ships with four editorial moods:
- **Warm Editorial**: `AppMood.warmEditorial`
- **Nordic Minimal**: `AppMood.nordicMinimal`
- **Dark Cinematic**: `AppMood.darkCinematic`
- **Vibrant Artistic**: `AppMood.vibrantArtistic`

Edit palette values in `lib/core/theme/color_palettes.dart`. Themes are built via `AppTheme.fromMood` in `lib/core/theme/app_theme.dart`.

## Typography
Typography is built around a serif + sans pairing:
- Display serif: `Playfair Display`
- UI sans: `Inter`
- Accent label: `DM Sans`

Update font sizes and weights in `lib/core/theme/typography.dart`.

## Spacing & radius
- Spacing tokens: `lib/core/theme/spacing.dart`
- Radius tokens: `lib/core/theme/radius.dart`

Generous margins and rhythm-based spacing drive the editorial feel.

## Motion
Motion primitives live in `lib/core/theme/motion.dart`. Scroll reveals and parallax helpers are in `lib/core/widgets/motion_widgets.dart`.

## Dashboard system
Dashboard modules are pluggable and role-aware:
1. Update feature flags in `lib/core/config/feature_flags.dart` or via the `featureFlagsProvider` in `lib/app/app_config.dart`.
2. Add a new dashboard in `lib/features/dashboards/dashboard_registry.dart`.
3. Provide the screen in `lib/features/dashboards/screens`.
4. Update role access via `UserRole` in `lib/core/models/user_role.dart`.

Example config:
```dart
ref.read(featureFlagsProvider.notifier).state = FeatureFlags(
  analyticsDashboard: true,
  activityDashboard: false,
  personalDashboard: true,
);
```

## Theme switching
Mood switching is handled by `moodControllerProvider` in `lib/app/theme_controller.dart`. The Settings screen demonstrates the UI.

## Adding new screens
Create a new feature folder under `lib/features`, add the route in `lib/app/router.dart`, and use `EditorialScaffold` for the layout baseline.

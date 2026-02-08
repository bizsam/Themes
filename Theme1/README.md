# Aurora Atelier · Editorial Flutter Template

A design-forward Flutter starter inspired by premium magazines, cultural brands, and boutique creative platforms. Built for storytelling, emotional design, and mood-based theming.

## What’s inside
- **Immersion**: full-screen splash + story onboarding
- **Discovery**: editorial feed, highlights, and collections
- **Profile**: visual bio and portfolio grid
- **Content**: media-rich article view with parallax and reveal motion
- **Settings**: mood palette switcher + dashboard feature flags
- **Dashboards**: modular Analytics, Activity, and Personal modes

## Folder structure
```
lib/
  app/
    app.dart
    app_config.dart
    router.dart
    theme_controller.dart
  core/
    config/
      feature_flags.dart
    models/
      user_role.dart
    theme/
      app_theme.dart
      color_palettes.dart
      motion.dart
      radius.dart
      spacing.dart
      theme_extensions.dart
      typography.dart
    widgets/
      editorial_card.dart
      editorial_scaffold.dart
      halo_painter.dart
      motion_widgets.dart
  features/
    dashboards/
      data/
      models/
      screens/
      dashboard_registry.dart
    magazine/
      screens/
```

## Usage examples
- Start at `/immersion` for the full-screen intro.
- Route to `/discovery`, `/profile`, `/content`, and `/settings` for the core narrative screens.
- Open `/dashboards` to view role-aware dashboard modes and `/dashboard/:id` for direct activation.

## Customization guide
See `docs/CUSTOMIZATION_GUIDE.md` for mood palettes, typography, and dashboard configuration.

## Design rationale
See `docs/DESIGN_RATIONALE.md` for the editorial design logic and visual system choices.

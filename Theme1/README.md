# Aurora Flutter App Template

A premium, product-grade Flutter starter for consumer apps inspired by modern fintech and social experiences.

## Folder structure
```
lib/
  app/
    app.dart
    router.dart
    theme_controller.dart
  core/
    theme/
      app_theme.dart
      color_palettes.dart
      motion.dart
      radius.dart
      spacing.dart
      theme_extensions.dart
      typography.dart
    widgets/
      app_buttons.dart
      app_scaffold.dart
      app_text_field.dart
      responsive_padding.dart
      section_header.dart
  features/
    auth/screens/
    core/screens/
    identity/screens/
    states/screens/
```

## Usage examples
- Start at `/splash` and move to `/onboarding` for the intro carousel.
- Theme options live in Settings and are powered by Riverpod state.
- Core navigation uses a Material 3 `NavigationBar` with Home/Search/Alerts/Profile.

## Customization guide
See `docs/CUSTOMIZATION_GUIDE.md` for theming, typography, and motion customization.

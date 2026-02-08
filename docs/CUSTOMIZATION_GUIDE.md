# Aurora Flutter Template · Customization Guide

## Brand themes
- **Light (Fintech)**: `AppTheme.light()` uses `AppColorPalettes.fintech`.
- **Dark Luxury**: `AppTheme.dark()` uses `AppColorPalettes.darkLuxury`.
- **Pastel Premium**: `AppTheme.altBrand()` uses `AppColorPalettes.pastelPremium`.

Update palette values in `lib/core/theme/color_palettes.dart` and the Material 3 tokens will follow automatically via `ColorScheme.fromSeed`.

## Typography
The type system is defined in `lib/core/theme/typography.dart` using Google Fonts (`Manrope` for headings, `Inter` for UI). Update weights or sizes here for global impact.

## Spacing & Radius
- Spacing tokens: `lib/core/theme/spacing.dart`
- Radius tokens: `lib/core/theme/radius.dart`

## Motion
Motion durations and curves are centralized in `lib/core/theme/motion.dart`.

## Adding new screens
1. Create a feature folder under `lib/features/<feature>/screens`.
2. Add the route in `lib/app/router.dart`.
3. Use `AppScaffold`, `SectionHeader`, and the button/text-field components for consistency.

## State management
Riverpod is used for global state (example: theme selection in `lib/app/theme_controller.dart`). Add more `StateNotifier` or `AsyncNotifier` providers per feature.

## Accessibility
- Ensure text contrasts by staying within the provided palettes.
- Use `SwitchListTile.adaptive` for platform-aware toggles.
- Provide semantic labels for icons when adding new actions.

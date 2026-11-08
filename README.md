# Flame game template

A starter for mobile games built with **Flutter + [Flame](https://flame-engine.org/)**, from [Nirah Digital](https://nirah.co/).
Click **Use this template** on GitHub, then rename the package.

What you get:

- `lib/game/template_game.dart` — a `FlameGame` with a spawn loop, a tappable component, and score/miss `ValueNotifier`s.
- `lib/ui/` — menu, HUD and pause screens as Flutter widgets over the game (`overlayBuilderMap`).
- English and Arabic strings. The UI uses `EdgeInsetsDirectional`, so switching to Arabic mirrors it automatically.
- Portrait lock, dark theme, and tests using `flame_test`.

```bash
flutter pub get
flutter run
flutter test
```

## Make it yours

1. Rename the package: change `name:` in `pubspec.yaml` and the imports, and set your own bundle id / application id (currently `co.nirah.flame_game_template`).
2. Replace `Orb` and `TemplateGame` with your own game. Keep game state in notifiers that the HUD listens to.
3. Move strings to `gen-l10n` when you have more than a handful.

## Licence

MIT © 2026 Nirah Digital

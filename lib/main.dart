import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game/template_game.dart';
import 'ui/hud.dart';
import 'ui/menu.dart';
import 'ui/pause_overlay.dart';
import 'ui/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const TemplateApp());
}

/// Root app: switch [locale] to see the whole UI mirror (Arabic is RTL).
class TemplateApp extends StatefulWidget {
  const TemplateApp({super.key});

  @override
  State<TemplateApp> createState() => _TemplateAppState();
}

class _TemplateAppState extends State<TemplateApp> {
  Locale _locale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(_locale);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(colorSchemeSeed: const Color(0xFF3AA6B9), brightness: Brightness.dark),
      home: _Home(
        strings: strings,
        onToggleLanguage: () => setState(
          () => _locale = _locale.languageCode == 'en' ? const Locale('ar') : const Locale('en'),
        ),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home({required this.strings, required this.onToggleLanguage});

  final Strings strings;
  final VoidCallback onToggleLanguage;

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  late final TemplateGame _game = TemplateGame();
  bool _playing = false;

  @override
  Widget build(BuildContext context) {
    if (!_playing) {
      return MenuScreen(
        strings: widget.strings,
        onPlay: () => setState(() {
          _playing = true;
          _game.restart();
        }),
        onToggleLanguage: widget.onToggleLanguage,
      );
    }
    return Scaffold(
      body: GameWidget<TemplateGame>(
        game: _game,
        overlayBuilderMap: {
          Hud.id: (_, game) => Hud(game: game, strings: widget.strings),
          PauseOverlay.id: (_, game) => PauseOverlay(
                game: game,
                strings: widget.strings,
                onQuit: () => setState(() => _playing = false),
              ),
        },
        initialActiveOverlays: const [Hud.id],
      ),
    );
  }
}

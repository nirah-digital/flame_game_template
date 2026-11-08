import 'package:flutter/material.dart';

import '../game/template_game.dart';
import 'strings.dart';

class PauseOverlay extends StatelessWidget {
  const PauseOverlay({super.key, required this.game, required this.strings, required this.onQuit});

  static const id = 'pause';
  final TemplateGame game;
  final Strings strings;
  final VoidCallback onQuit;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(strings.paused, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),
            FilledButton(onPressed: game.resume, child: Text(strings.resume)),
            const SizedBox(height: 12),
            TextButton(onPressed: onQuit, child: Text(strings.quit)),
          ],
        ),
      ),
    );
  }
}

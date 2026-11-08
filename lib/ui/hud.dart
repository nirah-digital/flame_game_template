import 'package:flutter/material.dart';

import '../game/template_game.dart';
import 'strings.dart';

/// Flutter overlay on top of the game. Uses [AlignmentDirectional]/[EdgeInsetsDirectional]
/// so it mirrors automatically in right-to-left languages.
class Hud extends StatelessWidget {
  const Hud({super.key, required this.game, required this.strings});

  static const id = 'hud';
  final TemplateGame game;
  final Strings strings;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
        child: Row(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: game.score,
              builder: (_, v, _) => Text('${strings.score}: $v', style: const TextStyle(fontSize: 20)),
            ),
            const Spacer(),
            ValueListenableBuilder<int>(
              valueListenable: game.misses,
              builder: (_, v, _) => Text('${strings.misses}: $v/${TemplateGame.maxMisses}'),
            ),
            IconButton(onPressed: game.pause, icon: const Icon(Icons.pause)),
          ],
        ),
      ),
    );
  }
}

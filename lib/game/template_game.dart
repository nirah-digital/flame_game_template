import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

import '../ui/pause_overlay.dart';

/// A tiny tap-the-orbs game that shows the template's moving parts:
/// a FlameGame, a component with tap handling, an update loop, a score
/// notifier read by a Flutter HUD, and pause via overlays.
class TemplateGame extends FlameGame {
  final ValueNotifier<int> score = ValueNotifier(0);
  final ValueNotifier<int> misses = ValueNotifier(0);
  final Random _random = Random();
  double _spawnTimer = 0;

  static const int maxMisses = 5;

  @override
  Color backgroundColor() => const Color(0xFF0E1A24);

  /// Clears the world and starts a fresh round.
  void restart() {
    score.value = 0;
    misses.value = 0;
    _spawnTimer = 0;
    children.whereType<Orb>().toList().forEach((o) => o.removeFromParent());
    resumeEngine();
    overlays.remove(PauseOverlay.id);
  }

  void pause() {
    pauseEngine();
    overlays.add(PauseOverlay.id);
  }

  void resume() {
    overlays.remove(PauseOverlay.id);
    resumeEngine();
  }

  bool get isOver => misses.value >= maxMisses;

  @override
  void update(double dt) {
    super.update(dt);
    if (isOver) return;
    _spawnTimer -= dt;
    if (_spawnTimer <= 0) {
      _spawnTimer = max(0.35, 1.0 - score.value * 0.02);
      final x = 24 + _random.nextDouble() * (size.x - 48);
      add(Orb(position: Vector2(x, -20), speed: 120 + score.value * 3.0));
    }
  }
}

/// A falling circle. Tap it to score; if it reaches the bottom it counts as a miss.
class Orb extends CircleComponent with TapCallbacks, HasGameReference<TemplateGame> {
  Orb({required Vector2 position, required this.speed})
      : super(radius: 22, position: position, anchor: Anchor.center, paint: Paint()..color = const Color(0xFF3AA6B9));

  final double speed;

  @override
  void update(double dt) {
    super.update(dt);
    y += speed * dt;
    if (y > game.size.y + radius) {
      game.misses.value++;
      removeFromParent();
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (game.isOver) return;
    game.score.value++;
    removeFromParent();
  }
}

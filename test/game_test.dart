import 'package:flame/components.dart';
import 'package:flame_game_template/game/template_game.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tester = FlameTester(TemplateGame.new);

  tester.testGameWidget('an orb that falls off the bottom counts as a miss', setUp: (g, _) async {
    g.onGameResize(Vector2(400, 800));
    await g.add(Orb(position: Vector2(100, 900), speed: 100));
    await g.ready();
  }, verify: (g, _) async {
    g.update(0.1);
    expect(g.misses.value, 1);
  });

  tester.testGameWidget('restart resets the score', setUp: (g, _) async {
    g.score.value = 7;
    g.misses.value = 3;
  }, verify: (g, _) async {
    g.restart();
    expect(g.score.value, 0);
    expect(g.misses.value, 0);
  });
}

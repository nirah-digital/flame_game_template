import 'package:flutter/widgets.dart';

/// Minimal two-language strings. Swap for gen-l10n/ARB once the app grows.
class Strings {
  const Strings._(this.title, this.play, this.score, this.misses, this.paused, this.resume, this.quit,
      this.language, this.gameOver, this.playAgain);

  final String title, play, score, misses, paused, resume, quit, language, gameOver, playAgain;

  static Strings of(Locale locale) => locale.languageCode == 'ar' ? _ar : _en;

  static const _en = Strings._('Orb Tap', 'Play', 'Score', 'Misses', 'Paused', 'Resume', 'Quit',
      'العربية', 'Game over', 'Play again');
  static const _ar = Strings._('اضغط الكرة', 'العب', 'النقاط', 'الأخطاء', 'متوقفة', 'استئناف', 'خروج',
      'English', 'انتهت اللعبة', 'العب مرة أخرى');
}

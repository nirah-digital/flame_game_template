import 'package:flutter/material.dart';

import 'strings.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.strings, required this.onPlay, required this.onToggleLanguage});

  final Strings strings;
  final VoidCallback onPlay;
  final VoidCallback onToggleLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(strings.title, style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: 32),
              FilledButton(onPressed: onPlay, child: Text(strings.play)),
              const SizedBox(height: 12),
              TextButton(onPressed: onToggleLanguage, child: Text(strings.language)),
            ],
          ),
        ),
      ),
    );
  }
}

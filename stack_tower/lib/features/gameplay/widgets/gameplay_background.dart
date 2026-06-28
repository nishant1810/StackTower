import 'package:flutter/material.dart';

class GameplayBackground extends StatelessWidget {
  const GameplayBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'lib/core/assets/images/game/game_bg.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
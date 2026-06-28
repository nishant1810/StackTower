import 'package:flutter/material.dart';

class AnimatedScoreText extends StatelessWidget {
  final int score;

  const AnimatedScoreText({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1500),
      tween: Tween(
        begin: 0,
        end: score.toDouble(),
      ),
      builder: (_, value, __) {
        return Text(
          value.toInt().toString(),
          style: const TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
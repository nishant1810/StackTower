import 'package:flutter/material.dart';

class AnimatedScore extends StatelessWidget {
  final int score;
  final TextStyle? style;
  final Duration duration;

  const AnimatedScore({
    super.key,
    required this.score,
    this.style,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(
        begin: 0,
        end: score,
      ),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Text(
          '$value',
          textAlign: TextAlign.center,
          style: style ??
              const TextStyle(
                color: Colors.white,
                fontSize: 96,
                fontWeight: FontWeight.w900,
              ),
        );
      },
    );
  }
}
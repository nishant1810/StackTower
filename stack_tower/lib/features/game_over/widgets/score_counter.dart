import 'package:flutter/material.dart';

class ScoreCounter extends StatelessWidget {
  final int score;

  const ScoreCounter({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(
        begin: 0,
        end: score,
      ),
      duration: const Duration(milliseconds: 1800),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 18,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: const Color(0xFF00E5FF),
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF00E5FF),
                blurRadius: 20,
              ),
            ],
            color: Colors.black.withOpacity(.45),
          ),
          child: Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
        );
      },
    );
  }
}
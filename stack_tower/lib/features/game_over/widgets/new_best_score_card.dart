import 'package:flutter/material.dart';

class NewBestScoreCard extends StatelessWidget {
  final int score;

  const NewBestScoreCard({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.black.withOpacity(0.08),
        border: Border.all(
          color: const Color(0xFFFFC247),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFC247).withOpacity(0.35),
            blurRadius: 20,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: const Color(0xFF4F79FF).withOpacity(0.15),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          /// TOP LINE
          Positioned(
            left: 20,
            right: 20,
            top: 8,
            child: Container(
              height: 1,
              color: Colors.white.withOpacity(0.15),
            ),
          ),

          /// BOTTOM LINE
          Positioned(
            left: 20,
            right: 20,
            bottom: 8,
            child: Container(
              height: 1,
              color: Colors.white.withOpacity(0.08),
            ),
          ),

          /// SCORE
          Center(
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1200),
              tween: Tween(
                begin: 0,
                end: score.toDouble(),
              ),
              builder: (context, value, child) {
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      color: const Color(0xFFFFE082),
                      fontSize: 90,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      shadows: [
                        Shadow(
                          color: const Color(0xFFFFC247).withOpacity(0.9),
                          blurRadius: 18,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
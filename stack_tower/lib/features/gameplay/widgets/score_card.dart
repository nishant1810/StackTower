import 'dart:math' as math;

import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard({
    super.key,
    required this.score,
  });

  final int score;

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _glowController;

  @override
  void initState() {
    super.initState();

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowController,
      builder: (_, __) {
        final glow =
            20 +
                math.sin(
                  _glowController.value * math.pi,
                ) *
                    8;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xCC111827),
                Color(0xCC1F2937),
              ],
            ),
            border: Border.all(
              color: const Color(0xFF4FC3F7),
              width: 1.3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withValues(alpha: .25),
                blurRadius: glow,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              //--------------------------------------------------
              // TITLE
              //--------------------------------------------------

              const Text(
                "SCORE",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 6),

              //--------------------------------------------------
              // SCORE
              //--------------------------------------------------

              TweenAnimationBuilder<double>(
                duration: const Duration(
                  milliseconds: 350,
                ),
                tween: Tween(
                  begin: 0,
                  end: widget.score.toDouble(),
                ),
                builder: (_, value, __) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      height: 1,
                      shadows: [
                        Shadow(
                          color: Color(0xFF38BDF8),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
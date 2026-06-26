import 'dart:math' as math;

import 'package:flutter/material.dart';

class BestScoreCard extends StatefulWidget {
  const BestScoreCard({
    super.key,
    required this.score,
  });

  final int score;

  @override
  State<BestScoreCard> createState() =>
      _BestScoreCardState();
}

class _BestScoreCardState
    extends State<BestScoreCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final glow =
            18 +
                math.sin(
                  _controller.value * math.pi,
                ) *
                    10;

        return Container(
          width: 120,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(22),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xCC1A1200),
                Color(0xCC332100),
              ],
            ),
            border: Border.all(
              color: const Color(
                0xFFFFC107,
              ),
              width: 1.4,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.amber
                    .withValues(alpha: .30),
                blurRadius: glow,
              ),
              BoxShadow(
                color: Colors.orange
                    .withValues(alpha: .20),
                blurRadius: glow + 10,
              ),
            ],
          ),
          child: Column(
            mainAxisSize:
            MainAxisSize.min,
            children: [

              //------------------------------------
              // Trophy
              //------------------------------------

              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                  const LinearGradient(
                    colors: [
                      Color(0xFFFFE082),
                      Color(0xFFFFB300),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber
                          .withValues(
                        alpha: .40,
                      ),
                      blurRadius: glow,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                  size: 24,
                ),
              ),

              const SizedBox(height: 8),

              //------------------------------------
              // Label
              //------------------------------------

              const Text(
                "BEST",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                  fontWeight:
                  FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 4),

              //------------------------------------
              // Score
              //------------------------------------

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
                      fontSize: 24,
                      fontWeight:
                      FontWeight.w900,
                      shadows: [
                        Shadow(
                          color: Color(
                            0xFFFFD54F,
                          ),
                          blurRadius: 18,
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
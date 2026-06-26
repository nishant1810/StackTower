import 'dart:math' as math;

import 'package:flutter/material.dart';

class CoinsCard extends StatefulWidget {
  const CoinsCard({
    super.key,
    required this.coins,
  });

  final int coins;

  @override
  State<CoinsCard> createState() =>
      _CoinsCardState();
}

class _CoinsCardState extends State<CoinsCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
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
            14 +
                math.sin(
                  _controller.value * math.pi,
                ) *
                    8;

        final rotation =
            math.sin(
              _controller.value * math.pi * 2,
            ) *
                .15;

        return Container(
          padding:
          const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(18),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xCC241600),
                Color(0xCC3E2500),
              ],
            ),
            border: Border.all(
              color: const Color(
                0xFFFFD54F,
              ),
              width: 1.3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.amber
                    .withValues(
                  alpha: .28,
                ),
                blurRadius: glow,
              ),
            ],
          ),
          child: Row(
            mainAxisSize:
            MainAxisSize.min,
            children: [

              //--------------------------------
              // Coin
              //--------------------------------

              Transform.rotate(
                angle: rotation,
                child: Container(
                  width: 38,
                  height: 38,
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
                          alpha: .45,
                        ),
                        blurRadius: glow,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.monetization_on,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              //--------------------------------
              // Coins
              //--------------------------------

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  const Text(
                    "COINS",
                    style: TextStyle(
                      color:
                      Colors.white70,
                      fontSize: 10,
                      fontWeight:
                      FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),

                  TweenAnimationBuilder<double>(
                    duration:
                    const Duration(
                      milliseconds: 350,
                    ),
                    tween: Tween(
                      begin: 0,
                      end: widget.coins
                          .toDouble(),
                    ),
                    builder:
                        (_, value, __) {
                      return Text(
                        value
                            .toInt()
                            .toString(),
                        style:
                        const TextStyle(
                          color:
                          Colors.white,
                          fontSize: 22,
                          fontWeight:
                          FontWeight
                              .w900,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
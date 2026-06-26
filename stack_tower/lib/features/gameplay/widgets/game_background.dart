import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';

class GameBackground extends StatefulWidget {
  const GameBackground({
    super.key,
  });

  @override
  State<GameBackground> createState() =>
      _GameBackgroundState();
}

class _GameBackgroundState
    extends State<GameBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 12,
      ),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          final glow =
              .85 +
                  math.sin(
                    _controller.value *
                        math.pi *
                        2,
                  ) *
                      .05;

          return Stack(
            fit: StackFit.expand,
            children: [

              //--------------------------------------------------
              // Background Image
              //--------------------------------------------------

              Transform.scale(
                scale: glow,
                child: Image.asset(
                  AppAssets.gameBackground,
                  fit: BoxFit.cover,
                  filterQuality:
                  FilterQuality.high,
                ),
              ),

              //--------------------------------------------------
              // Aurora Glow
              //--------------------------------------------------

              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient:
                    RadialGradient(
                      radius: 1.3,
                      colors: [
                        Colors.blue
                            .withValues(
                          alpha: .12,
                        ),
                        Colors.purple
                            .withValues(
                          alpha: .08,
                        ),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              //--------------------------------------------------
              // Dark Overlay
              //--------------------------------------------------

              IgnorePointer(
                child: Container(
                  decoration:
                  const BoxDecoration(
                    gradient:
                    LinearGradient(
                      begin:
                      Alignment.topCenter,
                      end: Alignment
                          .bottomCenter,
                      colors: [
                        Color(
                          0x33000000,
                        ),
                        Colors
                            .transparent,
                        Color(
                          0xAA000000,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //--------------------------------------------------
              // Vignette
              //--------------------------------------------------

              IgnorePointer(
                child: Container(
                  decoration:
                  const BoxDecoration(
                    gradient:
                    RadialGradient(
                      radius: 1.25,
                      colors: [
                        Colors
                            .transparent,
                        Color(
                          0x44000000,
                        ),
                        Color(
                          0xCC000000,
                        ),
                      ],
                      stops: [
                        .55,
                        .82,
                        1,
                      ],
                    ),
                  ),
                ),
              ),

              //--------------------------------------------------
              // Ambient Glow
              //--------------------------------------------------

              Align(
                alignment:
                Alignment.bottomCenter,
                child: Container(
                  width: 340,
                  height: 220,
                  decoration:
                  BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors
                            .cyanAccent
                            .withValues(
                          alpha: .12,
                        ),
                        blurRadius: 140,
                        spreadRadius: 45,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
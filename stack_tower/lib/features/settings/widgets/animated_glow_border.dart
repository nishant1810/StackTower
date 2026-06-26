import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedGlowBorder extends StatefulWidget {
  final Widget child;

  const AnimatedGlowBorder({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedGlowBorder> createState() =>
      _AnimatedGlowBorderState();
}

class _AnimatedGlowBorderState
    extends State<AnimatedGlowBorder>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final glow =
            18 + sin(controller.value * pi * 2) * 10;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34),

            gradient: SweepGradient(
              transform: GradientRotation(
                controller.value * pi * 2,
              ),
              colors: const [
                Color(0xff00F5FF),
                Color(0xff3B82F6),
                Color(0xff7C3AED),
                Color(0xff00F5FF),
              ],
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withOpacity(.35),
                blurRadius: glow,
                spreadRadius: 2,
              ),
              BoxShadow(
                color: Colors.purple.withOpacity(.25),
                blurRadius: glow + 12,
                spreadRadius: 3,
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff141E38),
                          Color(0xff091121),
                        ],
                      ),
                    ),
                  ),

                  /// Glass shine
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: IgnorePointer(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(.12),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  widget.child,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
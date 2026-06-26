import 'dart:math';

import 'package:flutter/material.dart';

class GlowingIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const GlowingIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  State<GlowingIconButton> createState() =>
      _GlowingIconButtonState();
}

class _GlowingIconButtonState
    extends State<GlowingIconButton>
    with SingleTickerProviderStateMixin {

  late final AnimationController controller;

  bool pressed = false;

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

        return GestureDetector(
          onTapDown: (_) {
            setState(() => pressed = true);
          },
          onTapUp: (_) {
            setState(() => pressed = false);
            widget.onTap();
          },
          onTapCancel: () {
            setState(() => pressed = false);
          },
          child: AnimatedScale(
            duration: const Duration(milliseconds: 120),
            scale: pressed ? .92 : 1,
            child: Container(
              width: 62,
              height: 62,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                gradient: SweepGradient(
                  transform: GradientRotation(
                    controller.value * pi * 2,
                  ),
                  colors: const [
                    Color(0xff00F5FF),
                    Color(0xff7C3AED),
                    Color(0xff3B82F6),
                    Color(0xff00F5FF),
                  ],
                ),

                boxShadow: [

                  BoxShadow(
                    color: Colors.cyan.withOpacity(.35),
                    blurRadius: 28,
                  ),

                  BoxShadow(
                    color: Colors.purple.withOpacity(.25),
                    blurRadius: 40,
                  ),
                ],
              ),

              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff162240),
                        Color(0xff0A1028),
                      ],
                    ),

                    border: Border.all(
                      color: Colors.white24,
                    ),
                  ),

                  child: Stack(
                    children: [

                      /// Glass reflection
                      Positioned(
                        top: 6,
                        left: 10,
                        right: 10,
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(.18),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Icon(
                          widget.icon,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class AnimatedGradientText extends StatefulWidget {
  final String text;

  const AnimatedGradientText(
      this.text, {
        super.key,
      });

  @override
  State<AnimatedGradientText> createState() =>
      _AnimatedGradientTextState();
}

class _AnimatedGradientTextState
    extends State<AnimatedGradientText>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 4,
      ),
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
        final angle =
            controller.value * pi * 2;

        return ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(angle),
              colors: const [
                Color(0xff00E5FF),
                Color(0xff7C4DFF),
                Colors.white,
                Color(0xff00E5FF),
              ],
            ).createShader(rect);
          },
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 25,
                  color: Colors.cyan,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
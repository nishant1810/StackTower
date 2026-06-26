import 'package:flutter/material.dart';

class GlowCircle extends StatelessWidget {
  final Animation<double> glowAnimation;

  const GlowCircle({
    super.key,
    required this.glowAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: glowAnimation,
      builder: (context, child) {
        return Center(
          child: Transform.scale(
            scale: glowAnimation.value,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFB000).withOpacity(0.65),
                    blurRadius: 120,
                    spreadRadius: 50,
                  ),
                  BoxShadow(
                    color: const Color(0xFFFF8C00).withOpacity(0.45),
                    blurRadius: 180,
                    spreadRadius: 70,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
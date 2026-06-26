import 'package:flutter/material.dart';

class NeonGlow extends StatelessWidget {
  const NeonGlow({
    super.key,
    required this.animation,
    this.size = 280,
  });

  final Animation<double> animation;
  final double size;

  static const Color _primaryGlow = Color(0xFFFF9800);
  static const Color _secondaryGlow = Color(0xFFFFD54F);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: animation,
        child: _GlowLayer(size: size),
        builder: (context, child) {
          return Center(
            child: Transform.scale(
              scale: animation.value,
              alignment: Alignment.center,
              child: child,
            ),
          );
        },
      ),
    );
  }
}

class _GlowLayer extends StatelessWidget {
  const _GlowLayer({
    required this.size,
  });

  final double size;

  static const Color _primaryGlow = Color(0xFFFF9800);
  static const Color _secondaryGlow = Color(0xFFFFD54F);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: _primaryGlow.withValues(alpha: 0.55),
            blurRadius: 120,
            spreadRadius: 42,
          ),
          BoxShadow(
            color: _secondaryGlow.withValues(alpha: 0.22),
            blurRadius: 190,
            spreadRadius: 95,
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.05),
            blurRadius: 40,
            spreadRadius: 6,
          ),
        ],
      ),
    );
  }
}
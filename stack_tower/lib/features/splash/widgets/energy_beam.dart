import 'package:flutter/material.dart';

class EnergyBeam extends StatelessWidget {
  const EnergyBeam({
    super.key,
    required this.glow,
    this.width = 10,
    this.height = 220,
    this.verticalOffset = 40,
  });

  final Animation<double> glow;

  final double width;
  final double height;
  final double verticalOffset;

  static const Color _beamStart = Colors.white;
  static const Color _beamMiddle = Color(0xFFFFD54F);
  static const Color _beamEnd = Color(0xFFFF9800);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: glow,
        child: _Beam(
          width: width,
          height: height,
        ),
        builder: (context, child) {
          return Center(
            child: Transform.translate(
              offset: Offset(0, verticalOffset),
              child: Opacity(
                opacity: 0.65 + (glow.value * 0.35),
                child: Transform.scale(
                  alignment: Alignment.topCenter,
                  scaleY: glow.value,
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Beam extends StatelessWidget {
  const _Beam({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  static const Color _beamMiddle = Color(0xFFFFD54F);
  static const Color _beamEnd = Color(0xFFFF9800);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            _beamMiddle,
            _beamEnd,
            Colors.transparent,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: _beamEnd.withValues(alpha: 0.75),
            blurRadius: 35,
            spreadRadius: 8,
          ),
          BoxShadow(
            color: _beamMiddle.withValues(alpha: 0.25),
            blurRadius: 70,
            spreadRadius: 20,
          ),
        ],
      ),
    );
  }
}
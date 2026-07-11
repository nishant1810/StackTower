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

  static const Color _beamStart =
      Colors.white;

  static const Color _beamMiddle =
  Color(0xFFFFD54F);

  static const Color _beamEnd =
  Color(0xFFFF9800);

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size;

    final beamWidth =
    (size.width * 0.025)
        .clamp(8.0, 14.0);

    final beamHeight =
    (size.height * 0.28)
        .clamp(180.0, 320.0);

    final offsetY =
    (size.height * 0.05)
        .clamp(24.0, 48.0);

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: glow,
        child: _Beam(
          width: beamWidth,
          height: beamHeight,
        ),
        builder: (context, child) {
          return Center(
            child: Transform.translate(
              offset: Offset(
                0,
                offsetY,
              ),
              child: Opacity(
                opacity:
                0.65 +
                    (glow.value * 0.35),
                child: Transform.scale(
                  alignment:
                  Alignment.topCenter,
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

  static const Color _beamMiddle =
  Color(0xFFFFD54F);

  static const Color _beamEnd =
  Color(0xFFFF9800);

  @override
  Widget build(BuildContext context) {
    final screen =
        MediaQuery.of(context).size;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(
          100,
        ),
        gradient:
        const LinearGradient(
          begin:
          Alignment.topCenter,
          end:
          Alignment.bottomCenter,
          colors: [
            Colors.white,
            _beamMiddle,
            _beamEnd,
            Colors.transparent,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: _beamEnd
                .withValues(
              alpha: 0.75,
            ),
            blurRadius:
            (screen.width * 0.09)
                .clamp(
              24.0,
              40.0,
            ),
            spreadRadius:
            (screen.width * 0.02)
                .clamp(
              5.0,
              10.0,
            ),
          ),
          BoxShadow(
            color: _beamMiddle
                .withValues(
              alpha: 0.25,
            ),
            blurRadius:
            (screen.width * 0.18)
                .clamp(
              50.0,
              80.0,
            ),
            spreadRadius:
            (screen.width * 0.05)
                .clamp(
              14.0,
              24.0,
            ),
          ),
        ],
      ),
    );
  }
}
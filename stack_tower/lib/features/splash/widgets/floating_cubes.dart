import 'dart:math' as math;

import 'package:flutter/material.dart';

class FloatingCubes extends StatefulWidget {
  const FloatingCubes({
    super.key,
    this.cubeCount = 10,
  });

  final int cubeCount;

  @override
  State<FloatingCubes> createState() =>
      _FloatingCubesState();
}

class _FloatingCubesState
    extends State<FloatingCubes>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final List<_CubeData> _cubes;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 12,
      ),
    )..repeat();

    final random = math.Random(1810);

    _cubes = List.generate(
      widget.cubeCount,
          (_) => _CubeData(
        phase:
        random.nextDouble() *
            math.pi *
            2,
        amplitude:
        18 +
            random.nextDouble() *
                22,
        size:
        12 +
            random.nextDouble() *
                8,
        rotationSpeed:
        .4 +
            random.nextDouble() *
                .8,
        opacity:
        .04 +
            random.nextDouble() *
                .08,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen =
    MediaQuery.sizeOf(context);

    final cubeBaseSize =
    (screen.width * 0.035)
        .clamp(10.0, 22.0);

    final amplitudeBase =
    (screen.height * 0.04)
        .clamp(18.0, 40.0);

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            children: List.generate(
              _cubes.length,
                  (index) {
                final cube =
                _cubes[index];

                final x =
                    ((screen.width -
                        screen.width *
                            0.10) /
                        _cubes
                            .length) *
                        index +
                        screen.width *
                            0.05;

                final y =
                    screen.height *
                        0.18 +
                        math.sin(
                          (_controller
                              .value *
                              math.pi *
                              2) +
                              cube.phase,
                        ) *
                            (cube.amplitude /
                                40.0) *
                            amplitudeBase;

                return Positioned(
                  left: x,
                  top: y,
                  child:
                  Transform.rotate(
                    angle:
                    (_controller
                        .value *
                        math.pi *
                        2) *
                        cube.rotationSpeed,
                    child: _Cube(
                      size:
                      (cube.size /
                          20.0) *
                          cubeBaseSize,
                      opacity:
                      cube.opacity,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Cube extends StatelessWidget {
  const _Cube({
    required this.size,
    required this.opacity,
  });

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white
              .withValues(
            alpha: opacity,
          ),
          border: Border.all(
            color: Colors.cyanAccent
                .withValues(
              alpha: .45,
            ),
            width:
            (size * 0.08)
                .clamp(
              0.8,
              1.5,
            ),
          ),
          borderRadius:
          BorderRadius.circular(
            2,
          ),
        ),
      ),
    );
  }
}

class _CubeData {
  const _CubeData({
    required this.phase,
    required this.amplitude,
    required this.size,
    required this.rotationSpeed,
    required this.opacity,
  });

  final double phase;
  final double amplitude;
  final double size;
  final double rotationSpeed;
  final double opacity;
}
import 'package:flutter/material.dart';

class ScoreShineEffect extends StatefulWidget {
  final Widget child;

  const ScoreShineEffect({
    super.key,
    required this.child,
  });

  @override
  State<ScoreShineEffect> createState() =>
      _ScoreShineEffectState();
}

class _ScoreShineEffectState
    extends State<ScoreShineEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Stack(
          children: [
            widget.child,

            Positioned(
              left: -120 +
                  (420 * controller.value),
              child: Transform.rotate(
                angle: -.3,
                child: Container(
                  width: 40,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.white
                            .withValues(
                          alpha: 0.30,
                        ),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
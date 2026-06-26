import 'package:flutter/material.dart';

class AnimatedShine extends StatefulWidget {
  const AnimatedShine({
    super.key,
    this.duration = const Duration(seconds: 3),
    this.borderRadius =
    const BorderRadius.all(
      Radius.circular(28),
    ),
  });

  final Duration duration;
  final BorderRadius borderRadius;

  @override
  State<AnimatedShine> createState() =>
      _AnimatedShineState();
}

class _AnimatedShineState
    extends State<AnimatedShine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ClipRRect(
        borderRadius: widget.borderRadius,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final x =
                (_controller.value * 2 - 1) * 400;

            return Transform.translate(
              offset: Offset(x, 0),
              child: Transform.rotate(
                angle: -.45,
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.white
                            .withOpacity(.45),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
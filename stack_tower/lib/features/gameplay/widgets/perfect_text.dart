import 'package:flutter/material.dart';

class PerfectText extends StatefulWidget {
  const PerfectText({
    super.key,
    required this.x,
    required this.y,
    required this.points,
  });

  final double x;
  final double y;
  final int points;

  @override
  State<PerfectText> createState() =>
      _PerfectTextState();
}

class _PerfectTextState
    extends State<PerfectText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Positioned(
          left: widget.x,
          top: widget.y -
              (_controller.value * 80),
          child: Opacity(
            opacity: 1 - _controller.value,
            child: Text(
              "PERFECT\n+${widget.points}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.orangeAccent,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
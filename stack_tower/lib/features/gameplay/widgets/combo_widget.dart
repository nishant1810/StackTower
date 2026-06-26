import 'dart:math' as math;

import 'package:flutter/material.dart';

class ComboWidget extends StatefulWidget {
  const ComboWidget({
    super.key,
    required this.combo,
  });

  final int combo;

  @override
  State<ComboWidget> createState() =>
      _ComboWidgetState();
}

class _ComboWidgetState extends State<ComboWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 900,
      ),
    );
  }

  @override
  void didUpdateWidget(
      ComboWidget oldWidget,
      ) {
    super.didUpdateWidget(oldWidget);

    if (widget.combo > oldWidget.combo &&
        widget.combo > 1) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _comboColor() {
    if (widget.combo >= 15) {
      return Colors.redAccent;
    }

    if (widget.combo >= 10) {
      return Colors.deepOrange;
    }

    if (widget.combo >= 6) {
      return Colors.orange;
    }

    return Colors.cyanAccent;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.combo < 2) {
      return const SizedBox.shrink();
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final scale =
            1 +
                math.sin(
                  _controller.value * math.pi,
                ) *
                    .15;

        final opacity =
        Curves.easeOut.transform(
          1 - _controller.value,
        );

        final glow =
            20 +
                math.sin(
                  _controller.value * math.pi,
                ) *
                    15;

        final color = _comboColor();

        return Opacity(
          opacity: opacity,
          child: Transform.scale(
            scale: scale,
            child: Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(26),
                gradient: LinearGradient(
                  colors: [
                    color.withValues(alpha: .25),
                    Colors.black.withValues(alpha: .75),
                  ],
                ),
                border: Border.all(
                  color: color,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(
                      alpha: .45,
                    ),
                    blurRadius: glow,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize:
                MainAxisSize.min,
                children: [
                  Text(
                    "PERFECT",
                    style: TextStyle(
                      color: color,
                      fontSize: 14,
                      fontWeight:
                      FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "COMBO × ${widget.combo}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight:
                      FontWeight.w900,
                    ),
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
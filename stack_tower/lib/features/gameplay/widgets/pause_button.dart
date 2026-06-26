import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PauseButton extends StatefulWidget {
  const PauseButton({
    super.key,
    required this.onPressed,
    this.size = 64,
  });

  final VoidCallback onPressed;
  final double size;

  @override
  State<PauseButton> createState() =>
      _PauseButtonState();
}

class _PauseButtonState
    extends State<PauseButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool _pressed = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2200,
      ),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tap() {
    HapticFeedback.mediumImpact();

    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final glow =
            18 +
                math.sin(
                  _controller.value * math.pi,
                ) *
                    10;

        return AnimatedScale(
          duration: const Duration(
            milliseconds: 120,
          ),
          scale: _pressed ? .92 : 1,
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                _pressed = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                _pressed = false;
              });

              _tap();
            },
            onTapCancel: () {
              setState(() {
                _pressed = false;
              });
            },
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(22),

                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff0F172A),
                    Color(0xff1E293B),
                  ],
                ),

                border: Border.all(
                  color: const Color(
                    0xff4FC3F7,
                  ),
                  width: 1.5,
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.blue
                        .withValues(
                      alpha: .35,
                    ),
                    blurRadius: glow,
                  ),
                  BoxShadow(
                    color: Colors.cyan
                        .withValues(
                      alpha: .20,
                    ),
                    blurRadius: glow + 10,
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [

                  //------------------------------------------------
                  // Glow
                  //------------------------------------------------

                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                          .withValues(
                        alpha: .03,
                      ),
                    ),
                  ),

                  //------------------------------------------------
                  // Icon
                  //------------------------------------------------

                  const Icon(
                    Icons.pause_rounded,
                    color: Colors.white,
                    size: 30,
                  ),

                  //------------------------------------------------
                  // Highlight
                  //------------------------------------------------

                  Positioned(
                    top: 8,
                    left: 10,
                    right: 10,
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(
                          20,
                        ),
                        gradient:
                        LinearGradient(
                          colors: [
                            Colors.white
                                .withValues(
                              alpha: .18,
                            ),
                            Colors.transparent,
                          ],
                        ),
                      ),
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
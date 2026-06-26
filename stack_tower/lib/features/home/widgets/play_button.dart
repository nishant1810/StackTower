import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/home_controller.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({
    super.key,
    required this.controller,
    required this.onPressed,
    this.title = 'PLAY',
    this.icon = Icons.play_arrow_rounded,
    this.enabled = true,
    this.isLoading = false,
  });

  final HomeController controller;
  final VoidCallback onPressed;

  final String title;
  final IconData icon;

  final bool enabled;
  final bool isLoading;

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (!widget.enabled || widget.isLoading) return;

    if (_pressed != value) {
      setState(() {
        _pressed = value;
      });
    }
  }

  Future<void> _handleTap() async {
    if (!widget.enabled || widget.isLoading) return;

    HapticFeedback.mediumImpact();

    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final double buttonWidth = math.min(
      340.0,
      width * 0.78,
    ).toDouble();

    return AnimatedBuilder(
      animation: widget.controller.playGlowAnimation,
      builder: (_, __) {
        final value = widget.controller.playGlowAnimation.value;

        final glow =
            26 + math.sin(value * math.pi) * 14;

        final floating =
            math.sin(value * math.pi * 2) * 4;

        return Transform.translate(
          offset: Offset(0, floating),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 120),
            scale: _pressed ? .95 : value,
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: widget.enabled ? 1 : .65,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                  BorderRadius.circular(28),
                  splashColor: Colors.white10,
                  highlightColor:
                  Colors.transparent,
                  onTap: widget.enabled &&
                      !widget.isLoading
                      ? _handleTap
                      : null,
                  onHighlightChanged:
                  _setPressed,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(
                        28,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.cyanAccent
                              .withOpacity(
                            .35,
                          ),
                          blurRadius: glow,
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors
                              .deepPurpleAccent
                              .withOpacity(.25),
                          blurRadius:
                          glow + 12,
                        ),
                      ],
                    ),
                    child: _ButtonBody(
                      width: buttonWidth,
                      title: widget.title,
                      icon: widget.icon,
                      isLoading:
                      widget.isLoading,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ButtonBody extends StatelessWidget {
  const _ButtonBody({
    required this.width,
    required this.title,
    required this.icon,
    required this.isLoading,
  });

  final double width;
  final String title;
  final IconData icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 82,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF00C6FF),
            Color(0xFF3B82F6),
            Color(0xFF7C3AED),
          ],
        ),
        border: Border.all(
          color: Colors.white24,
          width: 1.3,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 20,
            right: 20,
            child: Container(
              height: 14,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                  20,
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white
                        .withOpacity(.28),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 250,
              ),
              child: isLoading
                  ? const SizedBox(
                key: ValueKey(
                  'loading',
                ),
                width: 28,
                height: 28,
                child:
                CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                ),
              )
                  : Row(
                key: const ValueKey(
                  'content',
                ),
                mainAxisSize:
                MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color:
                    Colors.white,
                    size: 38,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style:
                    const TextStyle(
                      color:
                      Colors.white,
                      fontSize: 28,
                      fontWeight:
                      FontWeight
                          .w900,
                      letterSpacing:
                      2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
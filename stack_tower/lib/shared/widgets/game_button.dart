import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameButton extends StatefulWidget {
  const GameButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.width = 320,
    this.height = 82,
    this.gradient,
    this.glowColor = const Color(0xFF00C6FF),
    this.borderRadius = 28,
    this.enabled = true,
  });

  final String title;
  final IconData? icon;
  final VoidCallback onPressed;

  final double width;
  final double height;
  final double borderRadius;

  final bool enabled;

  final Color glowColor;

  final Gradient? gradient;

  @override
  State<GameButton> createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {
  bool _pressed = false;

  void _tapDown(TapDownDetails _) {
    if (!widget.enabled) return;

    setState(() => _pressed = true);
  }

  void _tapCancel() {
    setState(() => _pressed = false);
  }

  void _tapUp(TapUpDetails _) {
    setState(() => _pressed = false);

    HapticFeedback.mediumImpact();

    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      scale: _pressed ? .95 : 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius:
          BorderRadius.circular(widget.borderRadius),
          onTap: widget.enabled ? widget.onPressed : null,
          onTapDown: _tapDown,
          onTapCancel: _tapCancel,
          onTapUp: _tapUp,
          splashColor: Colors.white12,
          highlightColor: Colors.transparent,
          child: Ink(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                widget.borderRadius,
              ),
              gradient:
              widget.gradient ??
                  const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF00C6FF),
                      Color(0xFF3B82F6),
                      Color(0xFF7C3AED),
                    ],
                  ),
              boxShadow: [
                BoxShadow(
                  color:
                  widget.glowColor.withValues(alpha: .35),
                  blurRadius: 28,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 34,
                  ),
                  const SizedBox(width: 12),
                ],
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
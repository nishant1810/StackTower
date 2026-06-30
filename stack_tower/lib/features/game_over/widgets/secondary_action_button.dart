import 'package:flutter/material.dart';

class SecondaryActionButton extends StatefulWidget {
  final IconData icon;
  final Color glowColor;
  final VoidCallback? onTap;
  final String? label;

  const SecondaryActionButton({
    super.key,
    required this.icon,
    required this.glowColor,
    required this.onTap,
    this.label,
  });

  @override
  State<SecondaryActionButton> createState() =>
      _SecondaryActionButtonState();
}

class _SecondaryActionButtonState
    extends State<SecondaryActionButton> {
  bool _pressed = false;

  bool get _isDisabled =>
      widget.onTap == null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _isDisabled
          ? null
          : (_) => setState(
            () => _pressed = true,
      ),
      onTapUp: _isDisabled
          ? null
          : (_) {
        setState(
              () => _pressed = false,
        );
        widget.onTap?.call();
      },
      onTapCancel: _isDisabled
          ? null
          : () => setState(
            () => _pressed = false,
      ),
      child: AnimatedScale(
        duration: const Duration(
          milliseconds: 120,
        ),
        scale: _pressed ? 0.96 : 1,
        child: Opacity(
          opacity: _isDisabled ? 0.45 : 1,
          child: Container(
            width: double.infinity,
            height: 78,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(22),
              color: Colors.transparent,
              border: Border.all(
                color: _isDisabled
                    ? Colors.grey
                    : const Color(
                  0xFF5FA8FF,
                ),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: (_isDisabled
                      ? Colors.grey
                      : widget.glowColor)
                      .withOpacity(0.35),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: _isDisabled
                      ? Colors.grey
                      : Colors.white,
                  size: 34,
                ),

                if (widget.label != null) ...[
                  const SizedBox(height: 4),

                  Text(
                    widget.label!,
                    style: TextStyle(
                      color: _isDisabled
                          ? Colors.grey
                          : Colors.white,
                      fontSize: 11,
                      fontWeight:
                      FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
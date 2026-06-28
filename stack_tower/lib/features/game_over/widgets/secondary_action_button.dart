import 'package:flutter/material.dart';

class SecondaryActionButton extends StatefulWidget {
  final IconData icon;
  final Color glowColor;
  final VoidCallback onTap;

  const SecondaryActionButton({
    super.key,
    required this.icon,
    required this.glowColor,
    required this.onTap,
  });

  @override
  State<SecondaryActionButton> createState() =>
      _SecondaryActionButtonState();
}

class _SecondaryActionButtonState
    extends State<SecondaryActionButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: _pressed ? 0.96 : 1,
        child: Container(
          width: double.infinity,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
              color: Colors.transparent,
            border: Border.all(
              color: const Color(0xFF5FA8FF),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.glowColor.withOpacity(0.35),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            children: [
              /// TOP HIGHLIGHT
              Positioned(
                left: 16,
                right: 16,
                top: 8,
                child: Container(
                  height: 1,
                  color: Colors.white.withOpacity(0.20),
                ),
              ),

              /// SHARE ICON
              Center(
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
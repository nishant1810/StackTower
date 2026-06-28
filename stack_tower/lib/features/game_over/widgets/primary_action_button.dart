import 'package:flutter/material.dart';

class PrimaryActionButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const PrimaryActionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  State<PrimaryActionButton> createState() =>
      _PrimaryActionButtonState();
}

class _PrimaryActionButtonState
    extends State<PrimaryActionButton> {
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
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.transparent,
            border: Border.all(
              color: const Color(0xFFFFC247),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFC247).withOpacity(0.35),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            children: [
              /// TOP HIGHLIGHT
              Positioned(
                top: 8,
                left: 16,
                right: 16,
                child: Container(
                  height: 1,
                  color: Colors.white.withOpacity(0.20),
                ),
              ),

              /// CONTENT
              Center(
                child: widget.title.isEmpty
                    ? const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 42,
                )
                    : Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      color: Colors.yellow,
                      size: 60,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
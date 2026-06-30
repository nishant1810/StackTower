import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({
    super.key,
    required this.controller,
    required this.onTap,
  });

  final HomeController controller;
  final VoidCallback onTap;

  @override
  State<SettingsButton> createState() =>
      _SettingsButtonState();
}

class _SettingsButtonState
    extends State<SettingsButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    const neonColor = Color(0xFF9A5FFF);

    return GestureDetector(
      onTapDown: (_) {
        setState(() => _pressed = true);
      },
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () {
        setState(() => _pressed = false);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: _pressed ? 0.92 : 1,
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),

            // Very transparent glass
            color: Colors.white.withValues(
              alpha: 0.03,
            ),

            border: Border.all(
              color: neonColor.withValues(
                alpha: 0.75,
              ),
              width: 1.2,
            ),

            boxShadow: [
              BoxShadow(
                color: neonColor.withValues(
                  alpha: 0.08,
                ),
                blurRadius: 10,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 4,
                left: 8,
                right: 8,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withValues(
                          alpha: 0.08,
                        ),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              Center(
                child: Icon(
                  Icons.settings_rounded,
                  color: neonColor.withValues(
                    alpha: 0.95,
                  ),
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
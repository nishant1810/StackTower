import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import 'animated_shine.dart';
import 'glass_card.dart';

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
    return AnimatedScale(
      duration: const Duration(milliseconds: 120),
      scale: _pressed ? .92 : 1,
      child: GestureDetector(
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
        child: GlassCard(
          padding: EdgeInsets.zero,
          borderRadius: 18,
          child: SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              children: [
                const AnimatedShine(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),

                const Center(
                  child: Icon(
                    Icons.settings_rounded,
                    color: Colors.white,
                    size: 30,
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
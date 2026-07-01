import 'package:flutter/material.dart';

class PauseButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color glowColor;
  final VoidCallback onTap;

  const PauseButton({
    super.key,
    required this.icon,
    required this.title,
    required this.glowColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 86,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: glowColor.withValues(
                alpha: 0.25,
              ),
              blurRadius: 30,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: glowColor.withValues(
              alpha: 0.10,
            ),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            side: BorderSide(
              color: glowColor.withValues(
                alpha: 0.8,
              ),
              width: 1.6,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(22),
            ),
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 38,
                color: Colors.white,
              ),

              const SizedBox(width: 16),

              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
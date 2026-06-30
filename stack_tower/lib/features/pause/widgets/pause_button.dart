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
      height: 72,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: glowColor.withValues(
                alpha: 0.35,
              ),
              blurRadius: 25,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor:
            glowColor.withValues(
              alpha: 0.12,
            ),
            foregroundColor: Colors.white,
            elevation: 0,
            side: BorderSide(
              color: glowColor,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(18),
            ),
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 28,
              ),

              const SizedBox(width: 12),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight:
                  FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class PauseButton extends StatelessWidget {
  final VoidCallback onTap;

  const PauseButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF00BFFF),
            width: 2,
          ),
          color: Colors.black.withOpacity(0.25),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00BFFF)
                  .withOpacity(0.35),
              blurRadius: 20,
            ),
          ],
        ),
        child: const Icon(
          Icons.pause,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
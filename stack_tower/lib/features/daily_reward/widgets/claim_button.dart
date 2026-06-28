import 'package:flutter/material.dart';

class ClaimButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;

  const ClaimButton({
    super.key,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: enabled ? 1 : .65,
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFE08A),
                Color(0xFFFFC857),
                Color(0xFFFFA800),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFFFFC857,
                ).withOpacity(.45),
                blurRadius: 30,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 24),

              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.18),
                ),
                child: const Icon(
                  Icons.card_giftcard_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Text(
                  enabled
                      ? 'CLAIM REWARD'
                      : 'COME BACK TOMORROW',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5,
                  ),
                ),
              ),

              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.18),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),

              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}
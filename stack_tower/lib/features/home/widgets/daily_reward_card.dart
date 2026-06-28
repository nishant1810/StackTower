import 'package:flutter/material.dart';

class DailyRewardCard extends StatelessWidget {
  const DailyRewardCard({
    super.key,
    required this.available,
    required this.onTap,
  });

  final bool available;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 130,
        decoration: BoxDecoration(
          color: const Color(0xFF081326)
              .withValues(alpha: .88),
          borderRadius:
          BorderRadius.circular(26),
          border: Border.all(
            color: const Color(0xFFFFB800),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFFB800)
                  .withValues(alpha: .20),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.card_giftcard,
                  size: 42,
                  color: Color(0xFFFFC857),
                ),

                const SizedBox(height: 8),

                const Text(
                  'REWARD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight:
                    FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  available
                      ? 'READY'
                      : 'CLAIMED',
                  style: TextStyle(
                    color: available
                        ? const Color(
                        0xFFFFC857)
                        : Colors.white54,
                    fontSize: 18,
                    fontWeight:
                    FontWeight.w900,
                  ),
                ),
              ],
            ),

            if (available)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration:
                  const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
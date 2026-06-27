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
            color: Color(0xFFFFB800),
            width: 1.5,
          )
        ),
        child: Stack(
          children: [
            const Center(
              child: Icon(
                Icons.card_giftcard,
                size: 50,
                color: Color(0xFFFFC857),
              ),
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
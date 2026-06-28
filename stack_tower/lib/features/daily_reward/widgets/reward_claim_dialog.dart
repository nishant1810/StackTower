import 'package:flutter/material.dart';

class RewardClaimDialog extends StatelessWidget {
  final int amount;

  const RewardClaimDialog({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF2B1455),
              Color(0xFF171B34),
            ],
          ),
        ),
        child: Column(
          mainAxisSize:
          MainAxisSize.min,
          children: [
            const Icon(
              Icons.workspace_premium,
              color: Color(0xFFFFC857),
              size: 90,
            ),

            const SizedBox(height: 20),

            const Text(
              'REWARD CLAIMED',
              style: TextStyle(
                color: Colors.white,
                fontWeight:
                FontWeight.w900,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              '+$amount',
              style: const TextStyle(
                color: Color(0xFFFFC857),
                fontWeight:
                FontWeight.w900,
                fontSize: 42,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
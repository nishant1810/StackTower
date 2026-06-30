import 'package:flutter/material.dart';

class CoinHeader extends StatelessWidget {
  const CoinHeader({
    super.key,
    required this.coins,
  });

  final int coins;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        20,
        16,
        20,
        12,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFD54F),
            Color(0xFFFFB300),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x55FFB300),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.monetization_on,
            color: Colors.white,
            size: 34,
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Text(
              'Your Coins',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Text(
            coins.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
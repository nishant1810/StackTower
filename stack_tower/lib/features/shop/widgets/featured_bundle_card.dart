import 'package:flutter/material.dart';

class FeaturedBundleCard extends StatelessWidget {
  const FeaturedBundleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF8B5CF6),
            Color(0xFF5B21B6),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 25,
            spreadRadius: 2,
            color: Color(0x668B5CF6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            '🔥 BEST VALUE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          Text(
            '10,000 Coins',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),

          SizedBox(height: 4),

          Text(
            '+ 100 Bonus Diamonds',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          SizedBox(height: 16),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '₹99',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
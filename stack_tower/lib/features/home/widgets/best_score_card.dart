import 'package:flutter/material.dart';

class BestScoreCard extends StatelessWidget {
  final int bestScore;

  const BestScoreCard({
    super.key,
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFF39D6FF);
    const glowColor = Color(0xFF4EE6FF);

    return Container(
      width: 165,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0A2347),
            Color(0xFF071120),
          ],
        ),
        border: Border.all(
          color: borderColor,
          width: 1.8,
        ),
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(.22),
            blurRadius: 24,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'BEST SCORE',
                style: TextStyle(
                  color: glowColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .5,
                ),
              ),
              Row(
                children: List.generate(
                  3,
                      (_) => Container(
                    width: 4,
                    height: 4,
                    margin: const EdgeInsets.only(left: 4),
                    decoration: const BoxDecoration(
                      color: glowColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// SCORE
          Row(
            children: [
              const Icon(
                Icons.emoji_events_rounded,
                color: Color(0xFFFFC857),
                size: 38,
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  bestScore.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          Container(
            height: 1,
            color: Colors.white.withOpacity(.08),
          ),

          const SizedBox(height: 12),

          const Row(
            children: [
              Icon(
                Icons.workspace_premium_rounded,
                color: glowColor,
                size: 20,
              ),

              SizedBox(width: 8),

              Text(
                'TOP 3%',
                style: TextStyle(
                  color: glowColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class BestScoreCard extends StatelessWidget {
  const BestScoreCard({
    super.key,
    required this.bestScore,
  });

  final int bestScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF061526),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF39D6FF),
          width: 1.4,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF39D6FF)
                .withOpacity(.20),
            blurRadius: 14,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            right: 4,
            child: Row(
              children: List.generate(
                3,
                    (_) => Container(
                  width: 3,
                  height: 3,
                  margin:
                  const EdgeInsets.only(
                    left: 2,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF39D6FF),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),

          Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emoji_events_rounded,
                color: Color(0xFFFFC84A),
                size: 30,
              ),

              const SizedBox(height: 6),

              const Text(
                'BEST',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                bestScore.toString(),
                maxLines: 1,
                overflow:
                TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'TOP',
                style: TextStyle(
                  color: Color(0xFF39D6FF),
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
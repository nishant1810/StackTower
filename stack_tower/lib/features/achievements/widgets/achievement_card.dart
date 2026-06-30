import 'package:flutter/material.dart';

import '../models/achievement_model.dart';

class AchievementCard extends StatelessWidget {
  final AchievementModel achievement;

  const AchievementCard({
    super.key,
    required this.achievement,
  });

  @override
  Widget build(BuildContext context) {
    final isUnlocked = achievement.unlocked;

    final displayProgress =
    achievement.progress > achievement.target
        ? achievement.target
        : achievement.progress;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(
          alpha: 0.08,
        ),
        border: Border.all(
          color: isUnlocked
              ? Colors.amber
              : Colors.white24,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isUnlocked
                ? Colors.amber.withValues(
              alpha: 0.25,
            )
                : Colors.black26,
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isUnlocked
                  ? Colors.amber.withValues(
                alpha: 0.18,
              )
                  : Colors.white10,
            ),
            child: Icon(
              achievement.icon,
              size: 30,
              color: isUnlocked
                  ? Colors.amber
                  : Colors.white70,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: TextStyle(
                    color: isUnlocked
                        ? Colors.white
                        : Colors.white70,
                    fontSize: 18,
                    fontWeight:
                    FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  achievement.description,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 12),

                ClipRRect(
                  borderRadius:
                  BorderRadius.circular(
                    12,
                  ),
                  child:
                  LinearProgressIndicator(
                    minHeight: 8,
                    value: achievement
                        .progressPercent,
                    backgroundColor:
                    Colors.white10,
                    valueColor:
                    AlwaysStoppedAnimation(
                      isUnlocked
                          ? Colors.amber
                          : Colors.cyan,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  '$displayProgress/${achievement.target}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight:
                    FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Icon(
            isUnlocked
                ? Icons.verified
                : Icons.lock_outline,
            color: isUnlocked
                ? Colors.amber
                : Colors.white54,
            size: 28,
          ),
        ],
      ),
    );
  }
}
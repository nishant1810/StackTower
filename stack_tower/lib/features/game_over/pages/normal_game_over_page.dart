import 'package:flutter/material.dart';

import '../widgets/best_score_card.dart';
import '../widgets/coin_reward_card.dart';
import '../widgets/futuristic_panel.dart';
import '../widgets/primary_action_button.dart';
import '../widgets/score_display.dart';
import '../widgets/secondary_action_button.dart';
import '../widgets/star_rating.dart';

class NormalGameOverPage extends StatelessWidget {
  final int score;
  final int bestScore;
  final int coins;

  final VoidCallback onReplay;
  final VoidCallback onHome;
  final VoidCallback onReward;

  const NormalGameOverPage({
    super.key,
    required this.score,
    required this.bestScore,
    required this.coins,
    required this.onReplay,
    required this.onHome,
    required this.onReward,
  });

  int get stars {
    if (score >= 500) return 3;
    if (score >= 250) return 2;
    if (score >= 100) return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 340,
        child: FuturisticPanel(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 4),

              /// TITLE
              const Text(
                'GAME OVER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFE8D8FF),
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 10),

              /// DIVIDER
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),

              const SizedBox(height: 12),

              /// STARS
              StarRating(
                stars: stars,
              ),

              const SizedBox(height: 12),

              /// SCORE
              ScoreDisplay(
                score: score,
              ),

              const SizedBox(height: 10),

              /// BEST SCORE
              BestScoreCard(
                bestScore: bestScore,
              ),

              const SizedBox(height: 12),

              /// COINS
              CoinRewardCard(
                coins: coins,
              ),

              const SizedBox(height: 18),

              /// PLAY BUTTON
              SizedBox(
                width: 220,
                child: PrimaryActionButton(
                  title: '',
                  icon: Icons.play_arrow_rounded,
                  onTap: onReplay,
                ),
              ),

              const SizedBox(height: 14),

              /// HOME + REWARD
              Row(
                children: [
                  Expanded(
                    child: SecondaryActionButton(
                      icon: Icons.home_rounded,
                      glowColor: const Color(0xFFB15DFF),
                      onTap: onHome,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SecondaryActionButton(
                      icon: Icons.play_circle_fill_rounded,
                      glowColor: const Color(0xFFFFA726),
                      onTap: onReward,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
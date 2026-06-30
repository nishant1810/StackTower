import 'package:flutter/material.dart';

import '../../../core/utils/responsive.dart';

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
  final VoidCallback? onReward;

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
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.w(context, 0.04),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300,
          ),
          child: FuturisticPanel(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: Responsive.h(context, 0.005),
                ),

                /// TITLE
                Text(
                  'GAME OVER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFE8D8FF),
                    fontSize: Responsive.sp(
                      context,
                      34,
                    ),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),

                SizedBox(
                  height: Responsive.h(context, 0.012),
                ),

                /// DIVIDER
                Container(
                  height: 1,
                  color: Colors.transparent,
                ),

                SizedBox(
                  height: Responsive.h(context, 0.015),
                ),

                /// STARS
                StarRating(
                  stars: stars,
                ),

                SizedBox(
                  height: Responsive.h(context, 0.015),
                ),

                /// SCORE
                ScoreDisplay(
                  score: score,
                ),

                SizedBox(
                  height: Responsive.h(context, 0.012),
                ),

                /// BEST SCORE
                BestScoreCard(
                  bestScore: bestScore,
                ),

                SizedBox(
                  height: Responsive.h(context, 0.015),
                ),

                /// COINS
                CoinRewardCard(
                  coins: coins,
                ),

                SizedBox(
                  height: Responsive.h(context, 0.025),
                ),

                /// PLAY BUTTON
                SizedBox(
                  width: Responsive.w(
                    context,
                    0.55,
                  ).clamp(220, 300),
                  child: PrimaryActionButton(
                    title: '',
                    icon: Icons.play_arrow_rounded,
                    onTap: onReplay,
                  ),
                ),

                SizedBox(
                  height: Responsive.h(context, 0.018),
                ),

                /// HOME + REWARD
                Row(
                  children: [
                    Expanded(
                      child: SecondaryActionButton(
                        icon: Icons.home_rounded,
                        label: 'HOME',
                        glowColor:
                        const Color(0xFFB15DFF),
                        onTap: onHome,
                      ),
                    ),

                    SizedBox(
                      width: Responsive.w(
                        context,
                        0.03,
                      ),
                    ),

                    Expanded(
                      child: SecondaryActionButton(
                        icon:
                        Icons.play_circle_fill_rounded,
                        label: '2X COINS',
                        glowColor:
                        const Color(0xFFFFA726),
                        onTap: onReward,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: Responsive.h(context, 0.005),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../core/utils/responsive.dart';

import '../widgets/best_score_card.dart';
import '../widgets/coin_reward_card.dart';
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

  bool get isNewBest => score >= bestScore;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.w(context, 0.05),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 340,
          ),
          child: TweenAnimationBuilder<double>(
            tween: Tween(
              begin: 0,
              end: 1,
            ),
            duration: const Duration(
              milliseconds: 700,
            ),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.scale(
                  scale: 0.9 + (value * 0.1),
                  child: child,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                24,
                28,
                24,
                24,
              ),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(
                      alpha: 0.08,
                    ),
                    Colors.white.withValues(
                      alpha: 0.03,
                    ),
                  ],
                ),
                border: Border.all(
                  color: const Color(
                    0xFFB15DFF,
                  ).withValues(
                    alpha: 0.18,
                  ),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0xFFB15DFF,
                    ).withValues(
                      alpha: 0.10,
                    ),
                    blurRadius: 35,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: const Color(
                      0xFF6EDBFF,
                    ).withValues(
                      alpha: 0.05,
                    ),
                    blurRadius: 50,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'GAME OVER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(
                        0xFFE8D8FF,
                      ),
                      fontSize: Responsive.sp(
                        context,
                        34,
                      ),
                      fontWeight:
                      FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),

                  if (isNewBest) ...[
                    const SizedBox(height: 10),

                    Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(
                          20,
                        ),
                        color: const Color(
                          0xFFFFC857,
                        ).withValues(
                          alpha: 0.15,
                        ),
                        border: Border.all(
                          color: const Color(
                            0xFFFFC857,
                          ).withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                      child: const Text(
                        "🏆 NEW BEST",
                        style: TextStyle(
                          color:
                          Color(0xFFFFD56A),
                          fontWeight:
                          FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],

                  SizedBox(
                    height: Responsive.h(
                      context,
                      0.02,
                    ),
                  ),

                  StarRating(
                    stars: stars,
                  ),

                  SizedBox(
                    height: Responsive.h(
                      context,
                      0.02,
                    ),
                  ),

                  ScoreDisplay(
                    score: score,
                  ),

                  SizedBox(
                    height: Responsive.h(
                      context,
                      0.015,
                    ),
                  ),

                  BestScoreCard(
                    bestScore: bestScore,
                  ),

                  SizedBox(
                    height: Responsive.h(
                      context,
                      0.015,
                    ),
                  ),

                  CoinRewardCard(
                    coins: coins,
                  ),

                  SizedBox(
                    height: Responsive.h(
                      context,
                      0.03,
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 68,
                    child: PrimaryActionButton(
                      title: '',
                      icon:
                      Icons.play_arrow_rounded,
                      onTap: onReplay,
                    ),
                  ),

                  SizedBox(
                    height: Responsive.h(
                      context,
                      0.02,
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child:
                        SecondaryActionButton(
                          icon:
                          Icons.home_rounded,
                          label: 'HOME',
                          glowColor:
                          const Color(
                            0xFFB15DFF,
                          ),
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
                        child:
                        SecondaryActionButton(
                          icon: Icons
                              .play_circle_fill_rounded,
                          label: '2X COINS',
                          glowColor:
                          const Color(
                            0xFFFFA726,
                          ),
                          onTap: onReward,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../core/utils/responsive.dart';

import '../widgets/celebration_particles.dart';
import '../widgets/new_best_score_card.dart';
import '../widgets/primary_action_button.dart';
import '../widgets/secondary_action_button.dart';

class NewBestGameOverPage extends StatelessWidget {
  final int score;
  final VoidCallback onReplay;
  final VoidCallback? onReward;

  const NewBestGameOverPage({
    super.key,
    required this.score,
    required this.onReplay,
    required this.onReward,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = Responsive.w(
      context,
      0.75,
    ).clamp(
      260.0,
      420.0,
    );

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(
              child: CelebrationParticles(),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.w(
                    context,
                    0.05,
                  ),
                ),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Responsive.h(
                        context,
                        0.06,
                      ),
                    ),

                    ConstrainedBox(
                      constraints:
                      const BoxConstraints(
                        maxWidth: 500,
                      ),
                      child: NewBestScoreCard(
                        score: score,
                      ),
                    ),

                    SizedBox(
                      height: Responsive.h(
                        context,
                        0.05,
                      ),
                    ),

                    SizedBox(
                      width: buttonWidth,
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

                    SizedBox(
                      width: buttonWidth,
                      child:
                      SecondaryActionButton(
                        icon: Icons
                            .monetization_on_rounded,
                        label: '2X COINS',
                        glowColor:
                        const Color(
                          0xFFFFC247,
                        ),
                        onTap: onReward,
                      ),
                    ),

                    SizedBox(
                      height: Responsive.h(
                        context,
                        0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
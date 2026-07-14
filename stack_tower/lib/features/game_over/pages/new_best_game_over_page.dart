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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                children: [
                  /// Score between NEW BEST text and trophy
                  SizedBox(
                    height: Responsive.h(
                      context,
                      0.34,
                    ),
                  ),

                  Center(
                    child: SizedBox(
                      width: 300,
                      child: NewBestScoreCard(
                        score: score,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: Responsive.h(
                      context,
                      0.22,
                    ),
                  ),

                  /// Buttons Row
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 76,
                          child: PrimaryActionButton(
                            title: '',
                            icon: Icons.refresh_rounded,
                            onTap: onReplay,
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: SizedBox(
                          height: 76,
                          child: SecondaryActionButton(
                            icon:
                            Icons.smart_display_rounded,
                            label: null,
                            glowColor:
                            const Color(0xFFFFC247),
                            onTap: onReward,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
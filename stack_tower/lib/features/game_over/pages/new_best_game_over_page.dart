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
    final screenWidth = MediaQuery.of(context).size.width;

    final buttonWidth = (screenWidth * 0.82).clamp(
      280.0,
      450.0,
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
                physics:
                const BouncingScrollPhysics(),
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
                        0.05,
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
                      height: 72,
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
                        0.025,
                      ),
                    ),

                    SizedBox(
                      width: buttonWidth,
                      height: 72,
                      child: SecondaryActionButton(
                        icon: Icons.ondemand_video_rounded,
                        label: 'WATCH AD TO CONTINUE',
                        glowColor: const Color(0xFFFFC247),
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
import 'package:flutter/material.dart';

import '../widgets/celebration_particles.dart';
import '../widgets/new_best_score_card.dart';
import '../widgets/primary_action_button.dart';
import '../widgets/secondary_action_button.dart';

class NewBestGameOverPage extends StatelessWidget {
  final int score;
  final VoidCallback onReplay;
  final VoidCallback onShare;

  const NewBestGameOverPage({
    super.key,
    required this.score,
    required this.onReplay,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          /// LIGHT PARTICLE OVERLAY
          const Positioned.fill(
            child: IgnorePointer(
              child: CelebrationParticles(),
            ),
          ),

          /// SCORE CARD
          Positioned(
            top: screenHeight * 0.30,
            left: 0,
            right: 0,
            child: Center(
              child: NewBestScoreCard(
                score: score,
              ),
            ),
          ),

          /// PLAY BUTTON
          Positioned(
            bottom: 125,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 280,
                child: PrimaryActionButton(
                  title: '',
                  icon: Icons.play_arrow_rounded,
                  onTap: onReplay,
                ),
              ),
            ),
          ),

          /// SHARE BUTTON
          Positioned(
            bottom: 45,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 280,
                child: SecondaryActionButton(
                  icon: Icons.share_rounded,
                  glowColor: const Color(0xFF4F79FF),
                  onTap: onShare,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
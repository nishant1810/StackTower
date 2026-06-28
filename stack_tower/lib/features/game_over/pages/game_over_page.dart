import 'package:flutter/material.dart';

import 'package:stack_tower/core/assets/app_assets.dart';
import 'package:stack_tower/features/game_over/pages/new_best_game_over_page.dart';
import 'package:stack_tower/features/game_over/pages/normal_game_over_page.dart';
import 'package:stack_tower/features/gameplay/pages/gameplay_page.dart';

class GameOverPage extends StatelessWidget {
  final int score;
  final int bestScore;
  final int coinsEarned;

  const GameOverPage({
    super.key,
    required this.score,
    required this.bestScore,
    required this.coinsEarned,
  });

  /// Show celebration when player beats OR equals best score
  bool get isNewBest => score >= bestScore;

  void _restartGame(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const GameplayPage(),
      ),
    );
  }

  void _goHome(BuildContext context) {
    Navigator.of(context).popUntil(
          (route) => route.isFirst,
    );
  }

  void _showReward(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Rewarded Ads Coming Soon'),
      ),
    );
  }

  void _shareScore(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Share Feature Coming Soon'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool showNewBestScreen = score >= bestScore;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// BACKGROUND
          Positioned.fill(
            child: Image.asset(
              showNewBestScreen
                  ? AppAssets.newBestBackground
                  : AppAssets.gameOverBackground,
              fit: BoxFit.cover,
            ),
          ),

          /// DARK OVERLAY
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.15),
            ),
          ),

          /// CONTENT
          SafeArea(
            child: showNewBestScreen
                ? NewBestGameOverPage(
              score: score,
              onReplay: () => _restartGame(context),
              onShare: () => _shareScore(context),
            )
                : NormalGameOverPage(
              score: score,
              bestScore: bestScore,
              coins: coinsEarned,
              onReplay: () => _restartGame(context),
              onHome: () => _goHome(context),
              onReward: () => _showReward(context),
            ),
          ),
        ],
      ),
    );
  }
}
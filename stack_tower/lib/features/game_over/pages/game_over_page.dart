import 'package:flutter/material.dart';

import 'package:stack_tower/core/assets/app_assets.dart';
import 'package:stack_tower/features/game_over/pages/new_best_game_over_page.dart';
import 'package:stack_tower/features/game_over/pages/normal_game_over_page.dart';
import 'package:stack_tower/features/gameplay/pages/gameplay_page.dart';

import '../../../core/services/ads/ad_service.dart';
import '../../../core/services/storage/storage_service.dart';

class GameOverPage extends StatefulWidget {
  final int score;
  final int bestScore;
  final int coinsEarned;

  const GameOverPage({
    super.key,
    required this.score,
    required this.bestScore,
    required this.coinsEarned,
  });

  @override
  State<GameOverPage> createState() =>
      _GameOverPageState();
}

class _GameOverPageState
    extends State<GameOverPage> {
  bool _rewardClaimed = false;

  bool get isNewBest =>
      widget.score >= widget.bestScore;

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

  Future<void> _showReward(
      BuildContext context) async {
    if (_rewardClaimed) return;

    AdService.showRewardedAd(
      onRewardEarned: () async {
        await StorageService.addCoins(
          widget.coinsEarned,
        );

        if (!mounted) return;

        setState(() {
          _rewardClaimed = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '+${widget.coinsEarned} Bonus Coins Added!',
            ),
          ),
        );
      },
    );
  }

  void _shareScore(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Share Feature Coming Soon',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool showNewBestScreen =
        widget.score >= widget.bestScore;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              showNewBestScreen
                  ? AppAssets.newBestBackground
                  : AppAssets.gameOverBackground,
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(
                0.15,
              ),
            ),
          ),

          SafeArea(
            child: showNewBestScreen
                ? NewBestGameOverPage(
              score: widget.score,
              onReplay: () =>
                  _restartGame(context),
              onReward: _rewardClaimed
                  ? null
                  : () => _showReward(context),
            )
                : NormalGameOverPage(
              score: widget.score,
              bestScore:
              widget.bestScore,
              coins:
              widget.coinsEarned,
              onReplay: () =>
                  _restartGame(context),
              onHome: () =>
                  _goHome(context),

              /// Rewarded Ad
              onReward: _rewardClaimed
                  ? null
                  : () => _showReward(
                context,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
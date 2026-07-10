import 'package:flutter/material.dart';

import 'package:stack_tower/core/assets/app_assets.dart';
import 'package:stack_tower/features/game_over/pages/new_best_game_over_page.dart';
import 'package:stack_tower/features/game_over/pages/normal_game_over_page.dart';

import '../../../core/services/ads/ad_service.dart';
import '../../../core/services/storage/storage_service.dart';

class GameOverPage extends StatefulWidget {
  final int score;
  final int bestScore;
  final int coinsEarned;
  final String themeId;

  final VoidCallback onRetry;
  final VoidCallback onHome;
  final VoidCallback onRevive;

  const GameOverPage({
    super.key,
    required this.score,
    required this.bestScore,
    required this.coinsEarned,
    required this.themeId,
    required this.onRetry,
    required this.onHome,
    required this.onRevive,
  });

  @override
  State<GameOverPage> createState() => _GameOverPageState();
}

class _GameOverPageState extends State<GameOverPage> {
  bool _rewardClaimed = false;

  String _getThemeGameOver() {
    switch (widget.themeId) {
      case 'sky':
        return AppAssets.skyGameOver;

      case 'neon':
        return AppAssets.neonGameOver;

      case 'purple':
        return AppAssets.purpleGameOver;

      case 'emerald':
        return AppAssets.emeraldGameOver;

      case 'lava':
        return AppAssets.lavaGameOver;

      case 'galaxy':
        return AppAssets.galaxyGameOver;

      default:
        return AppAssets.gameOverBackground;
    }
  }

  Future<void> _revive() async {
    if (_rewardClaimed) return;

    AdService.showRewardedAd(
      onRewardEarned: () async {
        if (!mounted) return;

        setState(() {
          _rewardClaimed = true;
        });

        widget.onRevive();
      },
    );
  }

  Future<void> _claimCoins() async {
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

  @override
  Widget build(BuildContext context) {
    final bool showNewBestScreen =
        widget.score >= widget.bestScore;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        widget.onHome();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.asset(
                showNewBestScreen
                    ? AppAssets.newBestBackground
                    : _getThemeGameOver(),
                fit: BoxFit.cover,
              ),
            ),

            SafeArea(
              child: showNewBestScreen
                  ? NewBestGameOverPage(
                score: widget.score,
                onReplay: widget.onRetry,
                onReward: _rewardClaimed
                    ? null
                    : _claimCoins,
              )
                  : NormalGameOverPage(
                score: widget.score,
                bestScore: widget.bestScore,
                coins: widget.coinsEarned,
                themeId: widget.themeId,
                onReplay: widget.onRetry,
                onHome: widget.onHome,
                onReward: _rewardClaimed
                    ? null
                    : _revive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
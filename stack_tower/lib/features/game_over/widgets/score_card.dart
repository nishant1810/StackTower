import 'package:flutter/material.dart';

import '../../gameplay/pages/gameplay_page.dart';
import '../widgets/best_score_card.dart';
import '../widgets/glass_panel.dart';
import '../widgets/neon_button.dart';
import '../widgets/new_best_banner.dart';
import '../widgets/score_counter.dart';
import '../widgets/star_rating.dart';
import '../widgets/trophy_widget.dart';

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

  static const Color neonBlue = Color(0xFF00E5FF);
  static const Color neonPurple = Color(0xFF9C4DFF);
  static const Color neonGold = Color(0xFFFFC247);

  @override
  State<GameOverPage> createState() => _GameOverPageState();
}

class _GameOverPageState extends State<GameOverPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  bool get isNewBest =>
      widget.score >= widget.bestScore &&
          widget.score > 0;

  int get stars {
    if (widget.score >= 500) return 3;
    if (widget.score >= 250) return 2;
    if (widget.score >= 100) return 1;
    return 0;
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _restartGame() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const GameplayPage(),
      ),
    );
  }

  void _goHome() {
    Navigator.of(context).popUntil(
          (route) => route.isFirst,
    );
  }

  void _showRewardMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Rewarded Ad Coming Soon',
        ),
      ),
    );
  }

  Widget _coinsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.25),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: GameOverPage.neonGold,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.monetization_on_rounded,
            color: GameOverPage.neonGold,
            size: 28,
          ),
          const SizedBox(width: 8),
          Text(
            '+${widget.coinsEarned}',
            style: const TextStyle(
              color: GameOverPage.neonGold,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _goHome,
            icon: const Icon(
              Icons.home_rounded,
            ),
            label: const Text('Home'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(0, 58),
              foregroundColor: Colors.white,
              side: const BorderSide(
                color: GameOverPage.neonBlue,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _showRewardMessage,
            icon: const Icon(
              Icons.play_circle_fill,
            ),
            label: const Text('+250'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(0, 58),
              foregroundColor:
              GameOverPage.neonGold,
              side: const BorderSide(
                color: GameOverPage.neonGold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _normalGameOver() {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                GameOverPage.neonBlue,
                GameOverPage.neonPurple,
              ],
            ).createShader(bounds);
          },
          child: const Text(
            'GAME OVER',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
            ),
          ),
        ),

        const SizedBox(height: 24),

        StarRating(
          stars: stars,
        ),

        const SizedBox(height: 24),

        ScoreCounter(
          score: widget.score,
        ),

        const SizedBox(height: 24),

        BestScoreCard(
          bestScore: widget.bestScore,
        ),
      ],
    );
  }

  Widget _newBestLayout() {
    return Column(
      children: [
        const NewBestBanner(),

        const SizedBox(height: 24),

        ScoreCounter(
          score: widget.score,
        ),

        const SizedBox(height: 24),

        const TrophyWidget(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/game/game_over.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.15),
                    Colors.black.withOpacity(.45),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: GlassPanel(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isNewBest)
                            _newBestLayout()
                          else
                            _normalGameOver(),

                          const SizedBox(height: 28),

                          _coinsCard(),

                          const SizedBox(height: 32),

                          NeonButton(
                            title: 'PLAY AGAIN',
                            icon:
                            Icons.play_arrow_rounded,
                            onTap: _restartGame,
                          ),

                          const SizedBox(height: 16),

                          _bottomButtons(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final panelWidth =
    (size.width * 0.88).clamp(300.0, 500.0);

    final titleSize =
    (size.width * 0.11).clamp(38.0, 60.0);

    final scoreSize =
    (size.width * 0.22).clamp(72.0, 130.0);

    final buttonHeight =
    (size.height * 0.085).clamp(64.0, 88.0);

    final spacing =
    (size.height * 0.02).clamp(12.0, 24.0);

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.03,
          ),
          child: Container(
            width: panelWidth,
            padding: EdgeInsets.symmetric(
              horizontal: panelWidth * 0.08,
              vertical: panelWidth * 0.08,
            ),
            decoration: BoxDecoration(
              color:
              const Color(0xFF2B1E4B).withOpacity(.78),
              borderRadius: BorderRadius.circular(36),
              border: Border.all(
                color: const Color(0xFF9B5DFF),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.35),
                  blurRadius: 30,
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
                    color: const Color(0xFFD7B4FF),
                    fontSize: titleSize,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),

                SizedBox(height: spacing * 1.3),

                Text(
                  score.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: scoreSize,
                    fontWeight: FontWeight.w900,
                    height: 1,
                    shadows: [
                      Shadow(
                        color:
                        Colors.white.withOpacity(.25),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: spacing * .3),

                Text(
                  'SCORE',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: titleSize * .28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),

                SizedBox(height: spacing * 1.4),

                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        title: 'BEST',
                        value: bestScore.toString(),
                        icon:
                        Icons.emoji_events_rounded,
                      ),
                    ),
                    SizedBox(width: spacing),
                    Expanded(
                      child: _StatCard(
                        title: 'COINS',
                        value: coins.toString(),
                        icon:
                        Icons.monetization_on_rounded,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: spacing * 1.8),

                _PrimaryButton(
                  height: buttonHeight,
                  icon: Icons.play_arrow_rounded,
                  label: 'PLAY AGAIN',
                  onTap: onReplay,
                ),

                SizedBox(height: spacing),

                Row(
                  children: [
                    Expanded(
                      child: _MenuButton(
                        icon: Icons.home_rounded,
                        label: 'HOME',
                        onTap: onHome,
                      ),
                    ),

                    SizedBox(width: spacing),

                    Expanded(
                      child: _MenuButton(
                        icon: Icons.ondemand_video_rounded,
                        label: 'Revive',
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
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.22),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color:
          const Color(0xFF9B5DFF).withOpacity(.45),
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Icon(
            icon,
            color: const Color(0xFFFFC857),
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final double height;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _PrimaryButton({
    required this.height,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFF52C5FF),
            width: 1.5,
          ),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF4A7DFF)
                  .withOpacity(.95),
              const Color(0xFF61C6FF)
                  .withOpacity(.85),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x553FAEFF),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: height * .40,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: height * .22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _MenuButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
          color:
          const Color(0xFF6A35D8).withOpacity(.25),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: const Color(0xFF9B5DFF),
            width: 1.2,
          ),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
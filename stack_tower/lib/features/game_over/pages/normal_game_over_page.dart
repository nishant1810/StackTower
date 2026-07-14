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
    (size.width * 0.10).clamp(34.0, 58.0);

    final scoreSize =
    (size.width * 0.24).clamp(80.0, 140.0);

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
              color: Colors.black.withOpacity(.18),
              borderRadius: BorderRadius.circular(36),
              border: Border.all(
                color: const Color(0xFF9B5DFF)
                    .withOpacity(.8),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF9B5DFF)
                      .withOpacity(.20),
                  blurRadius: 25,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [
                        Color(0xFFEED7FF),
                        Color(0xFFB982FF),
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'GAME OVER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleSize,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                ),

                SizedBox(height: spacing * 1.3),

                TweenAnimationBuilder<double>(
                  duration:
                  const Duration(milliseconds: 800),
                  tween: Tween(
                    begin: 0,
                    end: score.toDouble(),
                  ),
                  builder: (_, value, __) {
                    return Text(
                      value.toInt().toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: scoreSize,
                        fontWeight: FontWeight.w900,
                        height: 1,
                        shadows: [
                          Shadow(
                            color: Colors.white
                                .withOpacity(.6),
                            blurRadius: 20,
                          ),
                          Shadow(
                            color:
                            const Color(0xFF9B5DFF)
                                .withOpacity(.4),
                            blurRadius: 35,
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: spacing * .3),

                Text(
                  'SCORE',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: titleSize * .28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3,
                  ),
                ),

                SizedBox(height: spacing * 1.5),

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
                        icon: Icons
                            .monetization_on_rounded,
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
                        icon:
                        Icons.ondemand_video_rounded,
                        label: 'CONTINUE',
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
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color:
          const Color(0xFF9B5DFF).withOpacity(.45),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9B5DFF)
                .withOpacity(.12),
            blurRadius: 14,
          ),
        ],
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
            size: 26,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
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
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color(0xFF7ED3FF),
            width: 1.5,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4A7DFF),
              Color(0xFF61C6FF),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF52C5FF)
                  .withOpacity(.5),
              blurRadius: 24,
              spreadRadius: 1,
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
    return Opacity(
      opacity: onTap == null ? 0.4 : 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color:
            const Color(0xFF6A35D8).withOpacity(.18),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFF9B5DFF),
              width: 1.4,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF9B5DFF)
                    .withOpacity(.15),
                blurRadius: 14,
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
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
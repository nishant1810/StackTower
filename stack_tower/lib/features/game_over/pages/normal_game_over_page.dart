import 'package:flutter/material.dart';

class NormalGameOverPage extends StatelessWidget {
  final int score;
  final int bestScore;
  final int coins;
  final String themeId;

  final VoidCallback onReplay;
  final VoidCallback onHome;
  final VoidCallback? onReward;

  const NormalGameOverPage({
    super.key,
    required this.score,
    required this.bestScore,
    required this.coins,
    required this.themeId,
    required this.onReplay,
    required this.onHome,
    required this.onReward,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final buttonWidth = width * 0.26;
        final buttonHeight = height * 0.12;

        double finalLabelTop;
        double finalValueTop;

        double bestLabelTop;
        double bestValueTop;

        double coinsLabelTop;
        double coinsValueTop;

        double homeLeft;
        double retryLeft;
        double reviveRight;
        double buttonBottom;

        switch (themeId) {
          case 'sky':
            finalLabelTop = 0.487;
            finalValueTop = 0.511;

            bestLabelTop = 0.588;
            bestValueTop = 0.607;

            coinsLabelTop = 0.676;
            coinsValueTop = 0.697;

            homeLeft = 0.05;
            retryLeft = 0.38;
            reviveRight = 0.05;
            buttonBottom = 0.07;
            break;

          case 'neon':
            finalLabelTop = 0.535;
            finalValueTop = 0.562;

            bestLabelTop = 0.636;
            bestValueTop = 0.661;

            coinsLabelTop = 0.724;
            coinsValueTop = 0.743;

            homeLeft = 0.04;
            retryLeft = 0.37;
            reviveRight = 0.04;
            buttonBottom = 0.025;
            break;

          case 'purple':
            finalLabelTop = 0.524;
            finalValueTop = 0.538;

            bestLabelTop = 0.618;
            bestValueTop = 0.641;

            coinsLabelTop = 0.715;
            coinsValueTop = 0.735;

            homeLeft = 0.05;
            retryLeft = 0.38;
            reviveRight = 0.05;
            buttonBottom = 0.07;
            break;

          case 'emerald':
            finalLabelTop = 0.481;
            finalValueTop = 0.508;

            bestLabelTop = 0.58;
            bestValueTop = 0.605;

            coinsLabelTop = 0.681;
            coinsValueTop = 0.701;

            homeLeft = 0.05;
            retryLeft = 0.38;
            reviveRight = 0.05;
            buttonBottom = 0.07;
            break;

          case 'lava':
            finalLabelTop = 0.523;
            finalValueTop = 0.545;

            bestLabelTop = 0.623;
            bestValueTop = 0.645;

            coinsLabelTop = 0.72;
            coinsValueTop = 0.741;

            homeLeft = 0.05;
            retryLeft = 0.38;
            reviveRight = 0.05;
            buttonBottom = 0.04;
            break;

          case 'galaxy':
            finalLabelTop = 0.568;
            finalValueTop = 0.589;

            bestLabelTop = 0.651;
            bestValueTop = 0.671;

            coinsLabelTop = 0.738;
            coinsValueTop = 0.755;

            homeLeft = 0.03;
            retryLeft = 0.36;
            reviveRight = 0.03;
            buttonBottom = 0.02;
            break;

          default:
            finalLabelTop = 0.49;
            finalValueTop = 0.535;

            bestLabelTop = 0.60;
            bestValueTop = 0.645;

            coinsLabelTop = 0.71;
            coinsValueTop = 0.755;

            homeLeft = 0.05;
            retryLeft = 0.38;
            reviveRight = 0.05;
            buttonBottom = 0.03;
        }

        return Stack(
          children: [
            /// FINAL SCORE LABEL
            Positioned(
              top: height * finalLabelTop,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  'FINAL SCORE',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            /// FINAL SCORE VALUE
            Positioned(
              top: height * finalValueTop,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  '$score',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            /// BEST SCORE LABEL
            Positioned(
              top: height * bestLabelTop,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  'BEST SCORE',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            /// BEST SCORE VALUE
            Positioned(
              top: height * bestValueTop,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.emoji_events_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '$bestScore',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// COINS EARNED LABEL
            Positioned(
              top: height * coinsLabelTop,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  'COINS EARNED',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            /// COINS EARNED VALUE
            Positioned(
              top: height * coinsValueTop,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.monetization_on_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '$coins',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// HOME BUTTON TAP AREA
            Positioned(
              left: width * homeLeft,
              bottom: height * buttonBottom,
              width: buttonWidth,
              height: buttonHeight,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onHome,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

            /// RETRY BUTTON TAP AREA
            Positioned(
              left: width * retryLeft,
              bottom: height * buttonBottom,
              width: buttonWidth,
              height: buttonHeight,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onReplay,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

            /// REVIVE BUTTON TAP AREA
            Positioned(
              right: width * reviveRight,
              bottom: height * buttonBottom,
              width: buttonWidth,
              height: buttonHeight,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onReward,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:stack_tower/core/assets/app_assets.dart';

class RewardHeader extends StatelessWidget {
  const RewardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// CROWN EMBLEM
        /// CROWN EMBLEM
        SizedBox(
          width: 90,
          height: 90,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFC857)
                          .withOpacity(0.25),
                      blurRadius: 50,
                      spreadRadius: 8,
                    ),
                  ],
                ),
              ),

              Image.asset(
                AppAssets.crown,
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),

        const SizedBox(height: 6),

        /// TITLE
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'DAILY\nREWARD',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 58,
                height: 0.86,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
                foreground: Paint()
                  ..color = const Color(
                    0xFFFFC857,
                  ).withOpacity(0.25),
              ),
            ),

            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFF8DC),
                    Color(0xFFFFE082),
                    Color(0xFFFFC857),
                    Color(0xFFFFA000),
                  ],
                ).createShader(bounds);
              },
              child: const Text(
                'DAILY\nREWARD',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 58,
                  height: 0.86,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
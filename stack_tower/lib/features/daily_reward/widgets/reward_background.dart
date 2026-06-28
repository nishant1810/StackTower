import 'package:flutter/material.dart';
import 'package:stack_tower/core/assets/app_assets.dart';

class RewardBackground extends StatelessWidget {
  const RewardBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppAssets.dailyRewardBackground,
          fit: BoxFit.cover,
        ),

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.05),
                Colors.black.withOpacity(.15),
                Colors.black.withOpacity(.35),
                Colors.black.withOpacity(.55),
              ],
            ),
          ),
        ),

        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0, -0.4),
              radius: .9,
              colors: [
                const Color(
                  0xFFFFC857,
                ).withOpacity(.10),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../controllers/home_controller.dart';
import '../models/home_state.dart';

class HomeRightPanel extends StatelessWidget {
  const HomeRightPanel({
    super.key,
    required this.controller,
    required this.onRewardTap,
  });

  final HomeController controller;
  final VoidCallback onRewardTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeState>(
      valueListenable: controller.state,
      builder: (_, state, __) {
        return _DailyRewardCard(
          available: state.dailyRewardAvailable,
          onTap: onRewardTap,
        );
      },
    );
  }
}

class _DailyRewardCard extends StatelessWidget {
  const _DailyRewardCard({
    required this.available,
    required this.onTap,
  });

  final bool available;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(30, -110), // right, up
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAssets.dailyRewardIcon,
              width: 120,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
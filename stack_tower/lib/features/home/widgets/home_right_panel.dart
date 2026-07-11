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
    final size = MediaQuery.of(context).size;

    final iconSize =
    (size.width * 0.16).clamp(
      52.0,
      72.0,
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAssets.dailyRewardIcon,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
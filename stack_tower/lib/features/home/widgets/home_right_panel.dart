import 'package:flutter/material.dart';

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
        return SizedBox(
          width: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              _DailyRewardCard(
                available: state.dailyRewardAvailable,
                onTap: onRewardTap,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DailyRewardCard extends StatelessWidget {
  final bool available;
  final VoidCallback onTap;

  const _DailyRewardCard({
    required this.available,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFFFC857);

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              color: const Color(0xFF14101A).withOpacity(.88),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: gold,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: gold.withOpacity(.25),
                  blurRadius: 18,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.card_giftcard_rounded,
                  size: 44,
                  color: gold,
                ),
                // SizedBox(height: 8),
                // Text(
                //   'DAILY REWARD',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     color: gold,
                //     fontSize: 10,
                //     fontWeight: FontWeight.w800,
                //     letterSpacing: 0.8,
                //   ),
                // ),
              ],
            ),
          ),

          if (available)
            Positioned(
              top: -4,
              right: -4,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF3B30),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(.6),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
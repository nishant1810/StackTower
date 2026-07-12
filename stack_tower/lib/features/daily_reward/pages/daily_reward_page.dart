import 'package:flutter/material.dart';

import '../controllers/daily_reward_controller.dart';
import '../widgets/claim_button.dart';
import '../widgets/reward_background.dart';
import '../widgets/reward_grid.dart';
import '../widgets/reward_header.dart';
import '../widgets/reward_particles.dart';

class DailyRewardPage extends StatefulWidget {
  const DailyRewardPage({super.key});

  @override
  State<DailyRewardPage> createState() =>
      _DailyRewardPageState();
}

class _DailyRewardPageState extends State<DailyRewardPage> {
  late final DailyRewardController controller;

  @override
  void initState() {
    super.initState();

    controller = DailyRewardController();
    controller.addListener(_refresh);

    _initialize();
  }

  Future<void> _initialize() async {
    await controller.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller.removeListener(_refresh);
    controller.dispose();
    super.dispose();
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _claimReward() async {
    final amount = await controller.claimReward();

    if (!mounted || amount == null) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF1E243A),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Reward Claimed: $amount',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFF080B18),
        body: Center(
          child: CircularProgressIndicator(
            color: Color(0xFFFFC857),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF080B18),
      body: Stack(
        children: [
          const RewardBackground(),
          const RewardParticles(),

          /// GOLD GLOW
          Positioned(
            top: -100,
            left: -50,
            right: -50,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    const Color(
                      0xFFFFC857,
                    ).withOpacity(.18),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Column(
                children: [
                  /// CLOSE BUTTON
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.06),
                        border: Border.all(
                          color: Colors.white.withOpacity(.08),
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  /// HEADER
                  const RewardHeader(),

                  const SizedBox(height: 12),

                  /// REWARD GRID
                  Expanded(
                    child: RewardGrid(
                      rewards: controller.rewards,
                      currentDay: controller.currentDay,
                      canClaim: controller.canClaim,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// CLAIM BUTTON
                  ClaimButton(
                    enabled: controller.canClaim,
                    onPressed: _claimReward,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
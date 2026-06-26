import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../services/audio/audio_service.dart';
import '../../../services/audio/audio_type.dart';

import '../services/daily_reward_service.dart';
import '../widgets/reward_claim_button.dart';
import '../widgets/reward_day_card.dart';

class DailyRewardPage extends StatefulWidget {
  const DailyRewardPage({
    super.key,
  });

  @override
  State<DailyRewardPage> createState() =>
      _DailyRewardPageState();
}

class _DailyRewardPageState
    extends State<DailyRewardPage>
    with SingleTickerProviderStateMixin {
  final service =
      DailyRewardService.instance;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 8,
      ),
    )..repeat();

    service.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _claimReward() async {
    final reward =
    await service.claimReward();

    if (reward == 0) return;

    HapticFeedback.heavyImpact();

    await AudioService.instance.play(
      AudioType.reward,
    );

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor:
          const Color(0xff111827),

          shape:
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(
              24,
            ),
          ),

          content: Column(
            mainAxisSize:
            MainAxisSize.min,
            children: [

              const Icon(
                Icons.workspace_premium,
                size: 80,
                color: Colors.amber,
              ),

              const SizedBox(
                height: 18,
              ),

              const Text(
                "Reward Claimed!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              Text(
                "+$reward Coins",
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight:
                  FontWeight.w900,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );

                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text(
                    "Awesome!",
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: service,
      builder: (_, __) {
        return Scaffold(
          backgroundColor:
          const Color(
            0xff08111F,
          ),

          appBar: AppBar(
            title: const Text(
              "Daily Rewards",
            ),
            centerTitle: true,
            backgroundColor:
            Colors.transparent,
            elevation: 0,
          ),

          body: SafeArea(
            child: Column(
              children: [

                const SizedBox(
                  height: 20,
                ),

                //----------------------------------
                // Title
                //----------------------------------

                const Text(
                  "Login Every Day",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),

                const Text(
                  "Collect bigger rewards every day!",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                //----------------------------------
                // Reward Grid
                //----------------------------------

                Expanded(
                  child: GridView.builder(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),

                    itemCount:
                    service.days.length,

                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      crossAxisSpacing: 16,

                      mainAxisSpacing: 16,

                      childAspectRatio:
                      .82,
                    ),

                    itemBuilder:
                        (_, index) {
                      return RewardDayCard(
                        reward:
                        service.days[index],
                      );
                    },
                  ),
                ),

                //----------------------------------
                // Claim Button
                //----------------------------------

                Padding(
                  padding:
                  const EdgeInsets.all(
                    20,
                  ),
                  child:
                  RewardClaimButton(
                    canClaim:
                    service.canClaim,
                    onPressed:
                    _claimReward,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
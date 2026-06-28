import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import '../models/home_state.dart';

class HomeLeftPanel extends StatelessWidget {
  const HomeLeftPanel({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeState>(
      valueListenable: controller.state,
      builder: (_, state, __) {
        return SizedBox(
          width: 145,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _BestScoreCard(
                bestScore: state.bestScore,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BestScoreCard extends StatelessWidget {
  final int bestScore;

  const _BestScoreCard({
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 135,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF081A38),
            Color(0xFF071120),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF39D6FF),
          width: 1.6,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF39D6FF).withOpacity(.20),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'BEST SCORE',
                style: TextStyle(
                  color: Color(0xFF4EE6FF),
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Row(
                children: List.generate(
                  3,
                      (_) => Container(
                    width: 3,
                    height: 3,
                    margin: const EdgeInsets.only(
                      left: 3,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF4EE6FF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              const Icon(
                Icons.emoji_events_rounded,
                color: Color(0xFFFFC857),
                size: 34,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  bestScore.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          Container(
            height: 1,
            color: Colors.white.withOpacity(.08),
          ),

          const SizedBox(height: 10),

          const Row(
            children: [
              Icon(
                Icons.workspace_premium,
                color: Color(0xFF4EE6FF),
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                'TOP 3%',
                style: TextStyle(
                  color: Color(0xFF4EE6FF),
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
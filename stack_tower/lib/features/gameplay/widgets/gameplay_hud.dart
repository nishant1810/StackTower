import 'package:flutter/material.dart';

class GameplayHud extends StatelessWidget {
  final int score;
  final int combo;

  const GameplayHud({
    super.key,
    required this.score,
    required this.combo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// SCORE
          _ScoreWidget(
            score: score,
          ),

          const Spacer(),

          /// COMBO
          _ComboWidget(
            combo: combo,
          ),

          const Spacer(),

          /// SPACE FOR PAUSE BUTTON
          const SizedBox(
            width: 70,
          ),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  final int score;

  const _ScoreWidget({
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        const Text(
          'SCORE',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$score',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w900,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _ComboWidget extends StatelessWidget {
  final int combo;

  const _ComboWidget({
    required this.combo,
  });

  @override
  Widget build(BuildContext context) {
    if (combo <= 1) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF24160A),
        borderRadius:
        BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFFFC857),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFC857)
                .withOpacity(.25),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'COMBO',
            style: TextStyle(
              color: Color(0xFFFFD56A),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'x$combo',
            style: const TextStyle(
              color: Color(0xFFFFD56A),
              fontSize: 30,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
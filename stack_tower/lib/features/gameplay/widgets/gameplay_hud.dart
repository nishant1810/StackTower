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
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.015,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _ScoreWidget(
              score: score,
            ),
          ),

          if (combo > 1)
            _ComboWidget(
              combo: combo,
            ),

          SizedBox(
            width: size.width * 0.18,
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
    final width =
        MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          'SCORE',
          style: TextStyle(
            color: Colors.white70,
            fontSize: width * 0.032,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),

        SizedBox(
          height: width * 0.01,
        ),

        Text(
          '$score',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.09,
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
    final width =
        MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: width * 0.025,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF24160A),
        borderRadius:
        BorderRadius.circular(
          width * 0.045,
        ),
        border: Border.all(
          color: const Color(0xFFFFC857),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(
              0xFFFFC857,
            ).withOpacity(0.25),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'COMBO',
            style: TextStyle(
              color: const Color(
                0xFFFFD56A,
              ),
              fontSize: width * 0.028,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),

          SizedBox(
            height: width * 0.005,
          ),

          Text(
            'x$combo',
            style: TextStyle(
              color: const Color(
                0xFFFFD56A,
              ),
              fontSize: width * 0.07,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
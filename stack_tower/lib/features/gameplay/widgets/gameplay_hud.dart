import 'package:flutter/material.dart';

import '../controllers/gameplay_controller.dart';
import '../models/game_state.dart';
import 'best_score_card.dart';
import 'coins_card.dart';
import 'combo_widget.dart';
import 'pause_button.dart';
import 'score_card.dart';

class GameplayHud extends StatelessWidget {
  const GameplayHud({
    super.key,
    required this.controller,
  });

  final GameplayController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<GameState>(
      valueListenable: controller.state,
      builder: (_, state, __) {
        if (state.status == GameStatus.gameOver) {
          return const SizedBox.shrink();
        }

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 14,
            ),
            child: Column(
              children: [
                //--------------------------------------------------
                // TOP BAR
                //--------------------------------------------------

                Row(
                  children: [
                    PauseButton(
                      onPressed: controller.pauseGame,
                    ),

                    const Spacer(),

                    ScoreCard(
                      score: state.score,
                    ),

                    const Spacer(),

                    BestScoreCard(
                      score: state.bestScore,
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                //--------------------------------------------------
                // COINS
                //--------------------------------------------------

                Align(
                  alignment: Alignment.topRight,
                  child: CoinsCard(
                    coins: state.coinsEarned,
                  ),
                ),

                const Spacer(),

                //--------------------------------------------------
                // COMBO
                //--------------------------------------------------

                ComboWidget(
                  combo: state.combo,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
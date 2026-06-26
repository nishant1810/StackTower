import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import '../models/home_state.dart';
import 'currency_chip.dart';

class CurrencySection extends StatelessWidget {
  const CurrencySection({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller.towerOpacityAnimation,
      child: ValueListenableBuilder<HomeState>(
        valueListenable: controller.state,
        builder: (_, state, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrencyChip(
                icon: Icons.monetization_on_rounded,
                value: state.coins,
                color: const Color(0xFFFFC107),
                label: 'Coins',
              ),

              const SizedBox(height: 10),

              CurrencyChip(
                icon: Icons.diamond_rounded,
                value: state.gems,
                color: const Color(0xFF00C6FF),
                label: 'Gems',
              ),
            ],
          );
        },
      ),
    );
  }
}
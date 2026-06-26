import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import 'currency_section.dart';
import 'profile_card.dart';
import 'settings_button.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.controller,
    this.onSettingsTap,
  });

  final HomeController controller;
  final VoidCallback? onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: controller.topBarSlideAnimation,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ProfileCard(
                  controller: controller,
                ),
              ),

              const SizedBox(width: 12),

              SettingsButton(
                controller: controller,
                onTap: onSettingsTap ?? () {},
              ),
            ],
          ),

          const SizedBox(height: 12),

          CurrencySection(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
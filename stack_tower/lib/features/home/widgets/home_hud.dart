import 'package:flutter/material.dart';

import '../../profile/pages/profile_page.dart';
import '../controllers/home_controller.dart';
import '../models/home_state.dart';
import 'home_profile_card.dart';

class HomeHud extends StatelessWidget {
  const HomeHud({
    super.key,
    required this.controller,
    required this.onSettingsTap,
  });

  final HomeController controller;
  final VoidCallback onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeState>(
      valueListenable: controller.state,
      builder: (context, state, _) {
        return SizedBox(
          height: 90,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                    left: 6,
                  ),
                  child: HomeProfileCard(
                    playerName: state.playerName,
                    avatarPath: null,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Padding(
                padding: const EdgeInsets.only(
                  top: 6,
                  right: 6,
                ),
                child: SizedBox(
                  width: 52,
                  height: 52,
                  child: _SettingsButton(
                    onTap: onSettingsTap,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF091426),
              Color(0xFF0D1931),
            ],
          ),
          border: Border.all(
            color: const Color(0xFF9A5FFF),
            width: 1.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x339A5FFF),
              blurRadius: 16,
              spreadRadius: 1,
            ),
          ],
        ),
        child: const Icon(
          Icons.settings_rounded,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
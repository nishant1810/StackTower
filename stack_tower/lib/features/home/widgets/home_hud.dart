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
        final size = MediaQuery.of(context).size;

        final hudHeight =
        (size.height * 0.11).clamp(
          84.0,
          110.0,
        );

        final spacing =
        (size.width * 0.02).clamp(
          6.0,
          12.0,
        );

        final padding =
        (size.width * 0.012).clamp(
          2.0,
          8.0,
        );

        final settingsSize =
        (size.width * 0.12).clamp(
          46.0,
          56.0,
        );

        return SizedBox(
          height: hudHeight,
          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: padding,
                  ),
                  child: HomeProfileCard(
                    playerName: state.playerName,
                    photoUrl: state.photoUrl,
                    avatarPath: null,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const ProfilePage(),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(
                width: spacing,
              ),

              Padding(
                padding: EdgeInsets.only(
                  right: padding,
                ),
                child: SizedBox(
                  width: settingsSize,
                  height: settingsSize,
                  child: _SettingsButton(
                    onTap: onSettingsTap,
                    size: settingsSize,
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
    required this.size,
  });

  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final iconSize = size * 0.42;

    return InkWell(
      borderRadius:
      BorderRadius.circular(
        size * 0.35,
      ),
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(
            size * 0.35,
          ),
          gradient:
          const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF091426),
              Color(0xFF0D1931),
            ],
          ),
          border: Border.all(
            color:
            const Color(0xFF9A5FFF),
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
        child: Icon(
          Icons.settings_rounded,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}
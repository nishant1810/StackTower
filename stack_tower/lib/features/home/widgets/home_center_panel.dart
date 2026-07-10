import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../controllers/home_controller.dart';
import 'play_platform_button.dart';

class HomeCenterPanel extends StatelessWidget {
  const HomeCenterPanel({
    super.key,
    required this.controller,
    required this.onPlay,
  });

  final HomeController controller;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// STACK TOWER TITLE
        Transform.translate(
          offset: const Offset(0, 80),
          child: Image.asset(
            AppAssets.titleIcon,
            width: 230,
            fit: BoxFit.contain,
          ),
        ),

        /// PLAY BUTTON
        Transform.translate(
          offset: const Offset(0, -20),
          child: PlayPlatformButton(
            onPlay: onPlay,
          ),
        ),
      ],
    );
  }
}
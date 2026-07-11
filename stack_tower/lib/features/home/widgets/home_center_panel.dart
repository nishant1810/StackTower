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
    final size = MediaQuery.of(context).size;

    final titleWidth = (size.width * 0.66).clamp(
      200.0,
      340.0,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// GAME TITLE
        Image.asset(
          AppAssets.titleIcon,
          width: titleWidth,
          fit: BoxFit.contain,
        ),

        SizedBox(
          height: size.height * 0.015,
        ),

        /// PLAY BUTTON
        PlayPlatformButton(
          onPlay: onPlay,
        ),
      ],
    );
  }
}
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

    final titleWidth =
    (size.width * 0.70).clamp(240.0, 380.0);

    final overlap =
    (size.height * 0.06).clamp(20.0, 50.0);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// TITLE
          Image.asset(
            AppAssets.titleIcon,
            width: titleWidth,
            fit: BoxFit.contain,
          ),

          /// PULL PLAY BUTTON UP
          Transform.translate(
            offset: Offset(0, -overlap),
            child: PlayPlatformButton(
              onPlay: onPlay,
            ),
          ),
        ],
      ),
    );
  }
}
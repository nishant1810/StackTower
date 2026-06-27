import 'package:flutter/material.dart';

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
    return Align(
      alignment: const Alignment(0, 0.55),
      child: PlayPlatformButton(
        onPlay: onPlay,
      ),
    );
  }
}
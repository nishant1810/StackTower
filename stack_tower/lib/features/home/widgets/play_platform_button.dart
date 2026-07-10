import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';

class PlayPlatformButton extends StatefulWidget {
  const PlayPlatformButton({
    super.key,
    required this.onPlay,
  });

  final VoidCallback onPlay;

  @override
  State<PlayPlatformButton> createState() =>
      _PlayPlatformButtonState();
}

class _PlayPlatformButtonState
    extends State<PlayPlatformButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onPlay,
      onTapDown: (_) {
        setState(() => _pressed = true);
      },
      onTapUp: (_) {
        setState(() => _pressed = false);
      },
      onTapCancel: () {
        setState(() => _pressed = false);
      },
      child: Transform.translate(
        offset: const Offset(0, 30), // Move button downward
        child: AnimatedScale(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          scale: _pressed ? 0.92 : 1.0,
          child: Image.asset(
            AppAssets.playButton,
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
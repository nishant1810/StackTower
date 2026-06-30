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
    return AnimatedBuilder(
      animation: controller.towerFloatController,
      builder: (_, __) {
        return Stack(
          children: [
            // PLAY BUTTON
            Align(
              alignment: const Alignment(0, 0.72),
              child: ScaleTransition(
                scale: controller.playGlowAnimation,
                child: PlayPlatformButton(
                  onPlay: onPlay,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
class _HexPanelClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const cut = 10.0;

    return Path()
      ..moveTo(cut, 0)
      ..lineTo(size.width - cut, 0)
      ..lineTo(size.width, cut)
      ..lineTo(size.width, size.height - cut)
      ..lineTo(size.width - cut, size.height)
      ..lineTo(cut, size.height)
      ..lineTo(0, size.height - cut)
      ..lineTo(0, cut)
      ..close();
  }

  @override
  bool shouldReclip(
      CustomClipper<Path> oldClipper,
      ) {
    return false;
  }
}

class _HexBorderPainter extends CustomPainter {
  final Color color;

  _HexBorderPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    const cut = 10.0;

    final path = Path()
      ..moveTo(cut, 0)
      ..lineTo(size.width - cut, 0)
      ..lineTo(size.width, cut)
      ..lineTo(size.width, size.height - cut)
      ..lineTo(size.width - cut, size.height)
      ..lineTo(cut, size.height)
      ..lineTo(0, size.height - cut)
      ..lineTo(0, cut)
      ..close();

    final glowPaint = Paint()
      ..color = color.withValues(alpha: .40)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..maskFilter =
      const MaskFilter.blur(
        BlurStyle.normal,
        10,
      );

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawPath(path, glowPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(
      CustomPainter oldDelegate,
      ) {
    return false;
  }
}
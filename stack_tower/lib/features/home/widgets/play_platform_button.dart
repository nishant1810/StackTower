import 'package:flutter/material.dart';

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
    const neonColor = Color(0xFF3BCFFF);

    return GestureDetector(
      onTapDown: (_) {
        setState(() => _pressed = true);
      },
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPlay();
      },
      onTapCancel: () {
        setState(() => _pressed = false);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: _pressed ? 0.95 : 1.0,
        child: CustomPaint(
          painter: _HexBorderPainter(neonColor),
          child: ClipPath(
            clipper: _HexPanelClipper(),
            child: Container(
              width: 200,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: 0.08),
                    Colors.white.withValues(alpha: 0.02),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipPath(
                        clipper: _HexPanelClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white
                                  .withValues(alpha: 0.10),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 5,
                    left: 10,
                    right: 10,
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withValues(
                              alpha: 0.15,
                            ),
                            Colors.white.withValues(
                              alpha: 0.01,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          color: neonColor,
                          size: 50,
                          shadows: [
                            Shadow(
                              color: neonColor,
                              blurRadius: 15,
                            ),
                            Shadow(
                              color: neonColor,
                              blurRadius: 30,
                            ),
                          ],
                        ),

                        const SizedBox(width: 8),

                        Text(
                          'PLAY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                color: neonColor
                                    .withValues(alpha: 0.8),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HexPanelClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const cut = 12.0;

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
    const cut = 12.0;

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
      ..color = color.withValues(alpha: 0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        12,
      );

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6;

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
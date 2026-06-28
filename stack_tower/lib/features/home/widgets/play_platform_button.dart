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

  void _handleTapDown(TapDownDetails details) {
    setState(() => _pressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _pressed = false);
    widget.onPlay();
  }

  void _handleTapCancel() {
    setState(() => _pressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: _pressed ? 0.96 : 1,
        child: SizedBox(
          width: 340,
          height: 140,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Bottom neon platform glow
              Positioned(
                bottom: 12,
                child: Container(
                  width: 250,
                  height: 14,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(999),
                    color: const Color(0xFF8D6BFF),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFF8D6BFF,
                        ).withOpacity(.95),
                        blurRadius: 45,
                        spreadRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),

              /// Main platform
              Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xFF57C7FF,
                      ).withOpacity(.55),
                      blurRadius: 40,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: ClipPath(
                  clipper: _PlatformClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(
                          0xFF87D8FF,
                        ),
                        width: 2.5,
                      ),
                      gradient:
                      const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1D47A4),
                          Color(0xFF0A1633),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient:
                              LinearGradient(
                                begin:
                                Alignment
                                    .topCenter,
                                end:
                                Alignment
                                    .bottomCenter,
                                colors: [
                                  Colors.white
                                      .withOpacity(
                                    .12,
                                  ),
                                  Colors
                                      .transparent,
                                ],
                              ),
                            ),
                          ),
                        ),

                        const Center(
                          child: Icon(
                            Icons
                                .play_arrow_rounded,
                            size: 78,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlatformClipper
    extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const cut = 40.0;

    return Path()
      ..moveTo(cut, 0)
      ..lineTo(size.width - cut, 0)
      ..lineTo(
        size.width,
        size.height / 2,
      )
      ..lineTo(
        size.width - cut,
        size.height,
      )
      ..lineTo(
        cut,
        size.height,
      )
      ..lineTo(
        0,
        size.height / 2,
      )
      ..close();
  }

  @override
  bool shouldReclip(
      CustomClipper<Path> oldClipper) {
    return false;
  }
}
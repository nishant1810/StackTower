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
    extends State<PlayPlatformButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2200,
      ),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final scale =
            1 + (_controller.value * 0.02);

        final glow =
            22 + (_controller.value * 14);

        return Transform.scale(
          scale: scale,
          child: GestureDetector(
            onTap: widget.onPlay,
            child: Container(
              width: 250,
              height: 86,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0xFF4FD8FF,
                    ).withOpacity(.45),
                    blurRadius: glow + 20,
                    spreadRadius: 5,
                  ),
                  BoxShadow(
                    color: const Color(
                      0xFFB55CFF,
                    ).withOpacity(.25),
                    blurRadius: glow + 10,
                  ),
                ],
              ),
              child: ClipPath(
                clipper: _HexButtonClipper(),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end:
                      Alignment.bottomRight,
                      colors: [
                        Color(0xFF4FD8FF),
                        Color(0xFF6D78FF),
                        Color(0xFFB55CFF),
                      ],
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(
                      3,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF041122),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration:
                            BoxDecoration(
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
                                      .08),
                                  Colors
                                      .transparent,
                                ],
                              ),
                            ),
                          ),
                        ),

                        const Center(
                          child: Row(
                            mainAxisSize:
                            MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                size: 42,
                                color: Colors.white,
                                shadows: const[
                                  Shadow(
                                    color: Colors.white,
                                    blurRadius: 35,
                                  ),
                                ],
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
          ),
        );
      },
    );
  }
}

class _HexButtonClipper
    extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const cut = 16.0;

    return Path()
      ..moveTo(cut, 0)
      ..lineTo(size.width - cut, 0)
      ..lineTo(size.width,
          size.height / 2)
      ..lineTo(
          size.width - cut, size.height)
      ..lineTo(cut, size.height)
      ..lineTo(0, size.height / 2)
      ..close();
  }

  @override
  bool shouldReclip(
      CustomClipper<Path> oldClipper) =>
      false;
}
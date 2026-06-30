import 'package:flutter/material.dart';

class FeatureDock extends StatelessWidget {
  const FeatureDock({
    super.key,
    required this.onLeaderboard,
    required this.onAchievements,
    required this.onShop,
    required this.onThemes,
  });

  final VoidCallback onLeaderboard;
  final VoidCallback onAchievements;
  final VoidCallback onShop;
  final VoidCallback onThemes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _DockCard(
            icon: Icons.emoji_events_rounded,
            label: 'LEADER',
            color: const Color(0xFF6EDBFF),
            onTap: onLeaderboard,
          ),
        ),

        const SizedBox(width: 6),

        Expanded(
          child: _DockCard(
            icon: Icons.star_rounded,
            label: 'MISSIONS',
            color: const Color(0xFF8FFFF7),
            onTap: onAchievements,
          ),
        ),

        const SizedBox(width: 6),

        Expanded(
          child: _DockCard(
            icon: Icons.shopping_cart_rounded,
            label: 'SHOP',
            color: const Color(0xFFFF7AFF),
            onTap: onShop,
          ),
        ),

        const SizedBox(width: 6),

        Expanded(
          child: _DockCard(
            icon: Icons.brush_rounded,
            label: 'THEMES',
            color: const Color(0xFF6EA6FF),
            onTap: onThemes,
          ),
        ),
      ],
    );
  }
}

class _DockCard extends StatefulWidget {
  const _DockCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  State<_DockCard> createState() => _DockCardState();
}

class _DockCardState extends State<_DockCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () {
        setState(() => _pressed = false);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: _pressed ? 0.95 : 1,
        child: CustomPaint(
          painter: _HexBorderPainter(widget.color),
          child: ClipPath(
            clipper: _HexPanelClipper(),
            child: Container(
              height: 84,
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
                              color: Colors.white.withValues(
                                alpha: 0.10,
                              ),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 4,
                    left: 8,
                    right: 8,
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withValues(
                              alpha: 0.12,
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.icon,
                          color: widget.color,
                          size: 32,
                          shadows: [
                            Shadow(
                              color: widget.color,
                              blurRadius: 12,
                            ),
                            Shadow(
                              color: widget.color,
                              blurRadius: 24,
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Text(
                          widget.label,
                          maxLines: 1,
                          overflow:
                          TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
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
      ..color = color.withValues(alpha: 0.22)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..maskFilter = const MaskFilter.blur(
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
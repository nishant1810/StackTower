import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BlockComponent extends PositionComponent {
  final Color color;
  final Vector2 blockSize;

  bool isActiveBlock = false;

  double glowPulse = 0;

  BlockComponent({
    required Vector2 position,
    required this.blockSize,
    required this.color,
  }) : super(
    position: position,
    size: blockSize,
  );

  /// Trigger landing glow
  void triggerGlowPulse() {
    glowPulse = 1.5;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (glowPulse > 0) {
      glowPulse -= dt * 3.5;

      if (glowPulse < 0) {
        glowPulse = 0;
      }
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    const double depth = 12;

    final frontRect = Rect.fromLTWH(
      0,
      depth,
      size.x,
      size.y - depth,
    );

    /// SHADOW
    canvas.drawRect(
      frontRect.shift(
        const Offset(4, 8),
      ),
      Paint()
        ..color = Colors.black.withOpacity(
          0.25,
        ),
    );

    /// OUTER GLOW
    if (isActiveBlock) {
      final glowPaint = Paint()
        ..color = color.withOpacity(
          (0.65 + glowPulse * 0.25)
              .clamp(0.0, 1.0),
        )
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          18 + glowPulse * 10,
        );

      canvas.drawRect(
        Rect.fromLTWH(
          -5,
          depth - 5,
          size.x + 10,
          size.y + 10,
        ),
        glowPaint,
      );
    }
    /// FRONT FACE
    final frontPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.lerp(
            color,
            Colors.white,
            0.55,
          )!,
          color,
          Color.lerp(
            color,
            Colors.black,
            0.35,
          )!,
        ],
      ).createShader(frontRect);

    canvas.drawRect(
      frontRect,
      frontPaint,
    );

    /// TOP FACE
    final topPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withOpacity(
            0.95,
          ),
          Color.lerp(
            color,
            Colors.white,
            0.55,
          )!,
        ],
      ).createShader(
        Rect.fromLTWH(
          0,
          0,
          size.x,
          depth,
        ),
      );

    final topPath = Path()
      ..moveTo(0, depth)
      ..lineTo(depth, 0)
      ..lineTo(size.x + depth, 0)
      ..lineTo(size.x, depth)
      ..close();

    canvas.drawPath(
      topPath,
      topPaint,
    );

    /// RIGHT FACE
    final sidePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.lerp(
            color,
            Colors.black,
            0.15,
          )!,
          Color.lerp(
            color,
            Colors.black,
            0.55,
          )!,
        ],
      ).createShader(
        Rect.fromLTWH(
          size.x,
          0,
          depth,
          size.y,
        ),
      );

    final sidePath = Path()
      ..moveTo(size.x, depth)
      ..lineTo(size.x + depth, 0)
      ..lineTo(
        size.x + depth,
        size.y - depth,
      )
      ..lineTo(size.x, size.y)
      ..close();

    canvas.drawPath(
      sidePath,
      sidePaint,
    );

    /// PREMIUM BORDER
    canvas.drawRect(
      frontRect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.white.withOpacity(
          0.35 + glowPulse * 0.25,
        ),
    );

    /// NEON EDGE
    canvas.drawRect(
      frontRect.inflate(1),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = color.withOpacity(
          0.50 + glowPulse * 0.25,
        ),
    );

    /// TOP LIGHT BAR
    canvas.drawLine(
      Offset(12, depth + 2),
      Offset(size.x - 12, depth + 2),
      Paint()
        ..strokeWidth = 2.5
        ..color = Colors.white.withOpacity(
          0.95,
        ),
    );

    /// INNER LIGHT STRIP
    canvas.drawRect(
      Rect.fromLTWH(
        size.x * 0.15,
        size.y * 0.45,
        size.x * 0.7,
        3,
      ),
      Paint()
        ..color = Colors.white.withOpacity(
          0.35 + glowPulse * 0.20,
        ),
    );

    /// CORNER LIGHT
    canvas.drawCircle(
      Offset(
        size.x * 0.88,
        size.y * 0.28,
      ),
      3 + glowPulse,
      Paint()
        ..color = Colors.white,
    );
  }
}
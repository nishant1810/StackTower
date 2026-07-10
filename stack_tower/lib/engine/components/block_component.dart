import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BlockComponent extends PositionComponent {
  final Color color;
  final Vector2 blockSize;

  bool isActiveBlock = false;
  bool special = false;

  double glowPulse = 0;
  double scalePulse = 0;

  BlockComponent({
    required Vector2 position,
    required this.blockSize,
    required this.color,
    this.special = false,
  }) : super(
    position: position,
    size: blockSize,
  );

  void triggerGlowPulse() {
    glowPulse = 1.5;
  }

  void triggerPulse() {
    glowPulse = 2.0;
    scalePulse = 1.2;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (glowPulse > 0) {
      glowPulse -= dt * 3.5;
      if (glowPulse < 0) glowPulse = 0;
    }

    if (scalePulse > 0) {
      scalePulse -= dt * 4;
      if (scalePulse < 0) scalePulse = 0;
    }
  }

  @override
  void render(Canvas canvas) {
    final pulseScale = 1 + (scalePulse * 0.15);

    canvas.save();

    canvas.translate(size.x / 2, size.y / 2);
    canvas.scale(pulseScale);
    canvas.translate(-size.x / 2, -size.y / 2);

    final rect = Rect.fromLTWH(
      0,
      0,
      size.x,
      size.y,
    );

    final rRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(10),
    );

    /// SHADOW UNDER BLOCK
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect.shift(const Offset(0, 6)),
        const Radius.circular(10),
      ),
      Paint()
        ..color = Colors.black.withOpacity(0.25)
        ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal,
          10,
        ),
    );

    /// ACTIVE BLOCK GLOW
    if (isActiveBlock) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          rect.inflate(10),
          const Radius.circular(14),
        ),
        Paint()
          ..color = color.withOpacity(0.45)
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            20,
          ),
      );
    }

    /// SPECIAL BLOCK GLOW
    if (special) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          rect.inflate(14),
          const Radius.circular(16),
        ),
        Paint()
          ..color = Colors.amber.withOpacity(0.35)
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            25,
          ),
      );
    }

    /// MAIN BLOCK BODY
    canvas.drawRRect(
      rRect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.lerp(color, Colors.white, 0.40)!,
            color,
            Color.lerp(color, Colors.black, 0.30)!,
          ],
        ).createShader(rect),
    );

    /// TOP LIGHT REFLECTION
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          4,
          4,
          size.x - 8,
          size.y * 0.22,
        ),
        const Radius.circular(8),
      ),
      Paint()
        ..color = Colors.white.withOpacity(0.22),
    );

    /// LEFT LIGHT EDGE
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        4,
        size.y,
      ),
      Paint()
        ..color = Colors.white.withOpacity(0.08),
    );

    /// RIGHT DEPTH SHADE
    canvas.drawRect(
      Rect.fromLTWH(
        size.x - 6,
        0,
        6,
        size.y,
      ),
      Paint()
        ..color = Colors.black.withOpacity(0.12),
    );

    /// BOTTOM DEPTH SHADE
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        size.y - 5,
        size.x,
        5,
      ),
      Paint()
        ..color = Colors.black.withOpacity(0.10),
    );

    /// PREMIUM BORDER
    canvas.drawRRect(
      rRect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.2
        ..color = Colors.white.withOpacity(0.45),
    );

    /// PULSE FLASH
    if (glowPulse > 0) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          rect.inflate(12 * glowPulse),
          const Radius.circular(16),
        ),
        Paint()
          ..color = Colors.white.withOpacity(
            glowPulse * 0.12,
          )
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            18,
          ),
      );
    }

    canvas.restore();
  }
}
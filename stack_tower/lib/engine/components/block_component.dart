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

    if (isActiveBlock) {
      canvas.drawRect(
        rect.inflate(8),
        Paint()
          ..color = color.withOpacity(0.4)
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            16,
          ),
      );
    }

    if (special) {
      canvas.drawRect(
        rect.inflate(10),
        Paint()
          ..color = Colors.amber.withOpacity(0.25)
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            20,
          ),
      );
    }

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect,
        const Radius.circular(8),
      ),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.lerp(color, Colors.white, 0.35)!,
            color,
            Color.lerp(color, Colors.black, 0.25)!,
          ],
        ).createShader(rect),
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect,
        const Radius.circular(8),
      ),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.white.withOpacity(0.4),
    );

    canvas.restore();
  }
}
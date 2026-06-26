import 'dart:ui';

class Particle {
  Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.color,
    required this.life,
  });

  double x;
  double y;

  double vx;
  double vy;

  double radius;

  double life;

  Color color;

  bool get alive => life > 0;

  void update(double dt) {
    x += vx * dt;
    y += vy * dt;

    vy += 500 * dt;

    life -= dt;
  }
}
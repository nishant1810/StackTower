import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'floating_hexagon.dart';

class NeonBackground extends StatefulWidget {
  const NeonBackground({super.key});

  @override
  State<NeonBackground> createState() =>
      _NeonBackgroundState();
}

class _NeonBackgroundState
    extends State<NeonBackground>
    with SingleTickerProviderStateMixin {

late final AnimationController controller;

@override
void initState() {
super.initState();

controller = AnimationController(
vsync: this,
duration: const Duration(seconds: 14),
)..repeat();
}

@override
void dispose() {
controller.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {

return AnimatedBuilder(
animation: controller,
builder: (_, __) {

final t = controller.value;

return Stack(
fit: StackFit.expand,
children: [

/// BASE
Container(
decoration: const BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [

Color(0xff030611),

Color(0xff081325),

Color(0xff111827),

],
),
),
),

//---------------------------------------------------
// BIG GLOWS
//---------------------------------------------------

Positioned(
top: -180 + sin(t * pi) * 25,
left: -170,

child: _glow(
380,
Colors.blueAccent,
),
),

Positioned(
top: 80,
right: -140 + cos(t * pi) * 25,

child: _glow(
320,
Colors.purpleAccent,
),
),

Positioned(
bottom: -180,
left: -100,

child: _glow(
340,
Colors.cyanAccent,
),
),

Positioned(
bottom: -140,
right: -130,

child: _glow(
300,
Colors.blue,
),
),

//---------------------------------------------------
// LIGHT BLOOM
//---------------------------------------------------

Positioned.fill(
child: IgnorePointer(
child: BackdropFilter(
filter: ImageFilter.blur(
sigmaX: 60,
sigmaY: 60,
),
child: Container(
color: Colors.transparent,
),
),
),
),

//---------------------------------------------------
// FLOATING HEXAGONS
//---------------------------------------------------

Positioned(
left: 25,
top: 140,
child: FloatingHexagon(
size: 80,
color: Colors.cyanAccent,
),
),

Positioned(
right: 35,
top: 260,
child: FloatingHexagon(
size: 62,
color: Colors.purpleAccent,
),
),

Positioned(
left: 55,
bottom: 190,
child: FloatingHexagon(
size: 72,
color: Colors.blueAccent,
),
),

Positioned(
right: 45,
bottom: 90,
child: FloatingHexagon(
size: 90,
color: Colors.tealAccent,
),
),

//---------------------------------------------------
// CYBER GRID
//---------------------------------------------------

CustomPaint(
painter: _CyberGridPainter(t),
),

  //---------------------------------------------------
  // SCANNER
  //---------------------------------------------------

  Align(
    alignment: Alignment(
      0,
      t * 2 - 1,
    ),
    child: IgnorePointer(
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [

              Colors.transparent,

              Colors.cyanAccent
                  .withOpacity(.8),

              Colors.transparent,

            ],
          ),
        ),
      ),
    ),
  ),

  //---------------------------------------------------
  // PARTICLES
  //---------------------------------------------------

  IgnorePointer(
    child: CustomPaint(
      painter: _ParticlePainter(t),
    ),
  ),

  //---------------------------------------------------
  // VIGNETTE
  //---------------------------------------------------

  IgnorePointer(
    child: Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 1.35,
          colors: [

            Colors.transparent,

            Colors.black.withOpacity(.60),

          ],
        ),
      ),
    ),
  ),
],
);
},
);
}

Widget _glow(
    double size,
    Color color,
    ) {

  return IgnorePointer(
    child: Container(
      width: size,
      height: size,

      decoration: BoxDecoration(
        shape: BoxShape.circle,

        color: color.withOpacity(.16),

        boxShadow: [

          BoxShadow(
            color: color.withOpacity(.5),
            blurRadius: size * .55,
            spreadRadius: 25,
          ),

        ],
      ),
    ),
  );
}
}

class _CyberGridPainter extends CustomPainter {
  final double animation;

  _CyberGridPainter(this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.cyan.withOpacity(.08)
      ..strokeWidth = 1;

    const double spacing = 40;

    // Vertical perspective lines
    for (double x = -size.width;
    x < size.width * 2;
    x += spacing) {
      canvas.drawLine(
        Offset(
          size.width / 2 +
              (x - size.width / 2) * .12,
          size.height * .42,
        ),
        Offset(
          x,
          size.height,
        ),
        paint,
      );
    }

    // Horizontal lines
    for (double y = size.height * .42;
    y < size.height;
    y += 34) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Horizon glow
    final glow = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          Colors.cyan.withOpacity(.25),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromLTWH(
          0,
          size.height * .42,
          size.width,
          8,
        ),
      );

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        size.height * .42,
        size.width,
        3,
      ),
      glow,
    );
  }

  @override
  bool shouldRepaint(covariant _CyberGridPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}

class _ParticlePainter extends CustomPainter {
  final double animation;

  _ParticlePainter(this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(10);

    for (int i = 0; i < 160; i++) {
      final dx = random.nextDouble() * size.width;

      final baseY = random.nextDouble() * size.height;

      final double dy =
      (baseY + sin(animation * 2 * pi + i) * 8)
          .clamp(0.0, size.height)
          .toDouble();

      final radius =
          1 + random.nextDouble() * 2;

      final alpha =
          .05 + random.nextDouble() * .20;

      final color = i.isEven
          ? Colors.cyanAccent
          : Colors.purpleAccent;

      final paint = Paint()
        ..color = color.withOpacity(alpha)
        ..maskFilter =
        const MaskFilter.blur(
          BlurStyle.normal,
          4,
        );

      canvas.drawCircle(
        Offset(dx, dy),
        radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _ParticlePainter oldDelegate) {
    return true;
  }
}
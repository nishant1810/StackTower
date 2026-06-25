import 'package:flutter/material.dart';

class EnergyBeam extends StatelessWidget {
  final Animation<double> glow;

  const EnergyBeam({
    super.key,
    required this.glow,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: glow,
      builder: (_, __) {
        return Center(
          child: Transform.translate(
            offset: const Offset(0, 40),
            child: Transform.scale(
              scaleY: glow.value,
              child: Container(
                width: 10,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Color(0xffffd54f),
                      Color(0xffff9800),
                      Colors.transparent,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(.8),
                      blurRadius: 35,
                      spreadRadius: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
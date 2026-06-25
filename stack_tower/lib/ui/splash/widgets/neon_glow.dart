import 'package:flutter/material.dart';

class NeonGlow extends StatelessWidget {
  final Animation<double> animation;

  const NeonGlow({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return Center(
          child: Transform.scale(
            scale: animation.value,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(.65),
                    blurRadius: 120,
                    spreadRadius: 50,
                  ),
                  BoxShadow(
                    color: Colors.yellow.withOpacity(.25),
                    blurRadius: 180,
                    spreadRadius: 90,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
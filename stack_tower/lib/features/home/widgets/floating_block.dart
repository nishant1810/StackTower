import 'dart:math';

import 'package:flutter/material.dart';

class FloatingBlock extends StatelessWidget {
  final double animation;

  const FloatingBlock({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final translateY = sin(animation * pi * 2) * 10;
    final rotation = sin(animation * pi * 2) * 0.08;

    return Transform.translate(
      offset: Offset(0, translateY),
      child: Transform.rotate(
        angle: rotation,
        child: SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              //---------------------------------
              // Golden Glow
              //---------------------------------

              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffFFD54F)
                          .withOpacity(.45),
                      blurRadius: 45,
                      spreadRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.orange.withOpacity(.30),
                      blurRadius: 70,
                    ),
                  ],
                ),
              ),

              //---------------------------------
              // Cube Shadow
              //---------------------------------

              Positioned(
                bottom: 18,
                child: Container(
                  width: 58,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.25),
                    borderRadius:
                    BorderRadius.circular(100),
                  ),
                ),
              ),

              //---------------------------------
              // Cube
              //---------------------------------

              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffFFE082),
                      Color(0xffFFC107),
                      Color(0xffF57F17),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white70,
                    width: 1.4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(.50),
                      blurRadius: 25,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    //---------------------------------
                    // Reflection
                    //---------------------------------

                    Positioned(
                      left: 10,
                      top: 8,
                      child: Container(
                        width: 22,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(100),
                          color:
                          Colors.white.withOpacity(.55),
                        ),
                      ),
                    ),

                    //---------------------------------
                    // Small Shine
                    //---------------------------------

                    Positioned(
                      right: 8,
                      bottom: 10,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //---------------------------------
              // Floating Sparkles
              //---------------------------------

              ...List.generate(
                8,
                    (i) {
                  final angle = i * pi / 4;

                  final radius =
                      46 + sin(animation * pi * 2 + i) * 6;

                  return Positioned(
                    left: 60 +
                        cos(angle) * radius -
                        2,
                    top: 60 +
                        sin(angle) * radius -
                        2,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amberAccent
                                .withOpacity(.8),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
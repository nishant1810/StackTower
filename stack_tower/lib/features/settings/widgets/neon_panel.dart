import 'dart:ui';

import 'package:flutter/material.dart';

import 'animated_glow_border.dart';
import 'pulse_ring.dart';

class NeonPanel extends StatelessWidget {
  final Widget child;

  const NeonPanel({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        AnimatedGlowBorder(
          child: Container(
            width: 420,
            margin: const EdgeInsets.only(top: 70),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 30,
                      sigmaY: 30,
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(
                        24,
                        90,
                        24,
                        28,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff141B3A),
                            Color(0xff0B1028),
                          ],
                        ),
                        border: Border.all(
                          color: Colors.white24,
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyan.withOpacity(.20),
                            blurRadius: 50,
                            spreadRadius: 2,
                          ),
                          BoxShadow(
                            color: Colors.purple.withOpacity(.18),
                            blurRadius: 70,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: child,
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: IgnorePointer(
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(.12),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const Positioned(
          top: -3,
          child: PulseRing(),
        ),

        Positioned(
          top: 0,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xff6D28D9),
                  Color(0xff3B82F6),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(.5),
                  blurRadius: 40,
                ),
                BoxShadow(
                  color: Colors.purple.withOpacity(.45),
                  blurRadius: 60,
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff111827),
                border: Border.all(
                  color: Colors.white24,
                ),
              ),
              child: const RotatingGear(),
            ),
          ),
        ),

        Positioned(
          top: 142,
          left: 60,
          right: 60,
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.cyanAccent.withOpacity(.6),
                  Colors.white,
                  Colors.cyanAccent.withOpacity(.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
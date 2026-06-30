import 'dart:ui';

import 'package:flutter/material.dart';

class FuturisticPanel extends StatelessWidget {
  final Widget child;

  const FuturisticPanel({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 340,
        ),
        child: Stack(
          children: [
            /// OUTER GLOW
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xFFAA6BFF,
                      ).withOpacity(0.22),
                      blurRadius: 40,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: const Color(
                        0xFF00E5FF,
                      ).withOpacity(0.12),
                      blurRadius: 32,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),

            /// PANEL
            ClipRRect(
              borderRadius:
              BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 16,
                  sigmaY: 16,
                ),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(30),
                    color: const Color(
                      0xFF0A1025,
                    ).withOpacity(0.35),
                    border: Border.all(
                      color: const Color(
                        0xFFB56DFF,
                      ).withOpacity(0.75),
                      width: 1.4,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          /// INNER BORDER
                          Positioned.fill(
                            child: Container(
                              margin:
                              const EdgeInsets.all(
                                5,
                              ),
                              decoration:
                              BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                  24,
                                ),
                                border: Border.all(
                                  color: Colors.white
                                      .withOpacity(
                                    0.05,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// TOP GLOW
                          Positioned(
                            top: -35,
                            left: 40,
                            right: 40,
                            child: Container(
                              height: 80,
                              decoration:
                              BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                  999,
                                ),
                                gradient:
                                RadialGradient(
                                  colors: [
                                    const Color(
                                      0xFFAA6BFF,
                                    ).withOpacity(
                                      0.15,
                                    ),
                                    Colors
                                        .transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.all(
                              8,
                            ),
                            child: child,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// CORNER ACCENTS
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 50,
                height: 2,
                color:
                const Color(0xFF00E5FF),
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 2,
                color:
                const Color(0xFFB56DFF),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 50,
                height: 2,
                color:
                const Color(0xFFB56DFF),
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 2,
                color:
                const Color(0xFF00E5FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
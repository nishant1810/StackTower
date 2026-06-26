import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/block_model.dart';

class MovingBlock extends StatefulWidget {
  const MovingBlock({
    super.key,
    required this.block,
  });

  final BlockModel? block;

  @override
  State<MovingBlock> createState() =>
      _MovingBlockState();
}

class _MovingBlockState extends State<MovingBlock>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1200,
      ),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final block = widget.block;

    if (block == null) {
      return const SizedBox.shrink();
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final glow =
            18 +
                math.sin(
                  _controller.value * math.pi,
                ) *
                    8;

        final shine =
            math.sin(
              _controller.value * math.pi * 2,
            ) *
                .15;

        return AnimatedPositioned(
          duration: const Duration(
            milliseconds: 16,
          ),
          curve: Curves.linear,
          left: block.x,
          top: block.y,
          width: block.width,
          height: block.height,
          child: IgnorePointer(
            child: RepaintBoundary(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(5),

                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      block.color.withValues(
                        alpha: .95,
                      ),
                      block.color,
                    ],
                  ),

                  border: Border.all(
                    color: Colors.white38,
                    width: 1.5,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: block.color.withValues(
                        alpha: .55,
                      ),
                      blurRadius: glow,
                      spreadRadius: 2,
                    ),
                  ],
                ),

                child: Stack(
                  children: [

                    //----------------------------------
                    // Top Reflection
                    //----------------------------------

                    Positioned(
                      top: 2,
                      left: 4,
                      right: 4,
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            12,
                          ),
                          gradient:
                          LinearGradient(
                            colors: [
                              Colors.white
                                  .withValues(
                                alpha:
                                .45 +
                                    shine,
                              ),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    //----------------------------------
                    // Center Glow
                    //----------------------------------

                    Center(
                      child: Container(
                        width: block.width * .55,
                        height: block.height * .35,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            30,
                          ),
                          color: Colors.white
                              .withValues(
                            alpha: .06,
                          ),
                        ),
                      ),
                    ),

                    //----------------------------------
                    // Bottom Shadow
                    //----------------------------------

                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          gradient:
                          LinearGradient(
                            begin:
                            Alignment.topCenter,
                            end: Alignment
                                .bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black
                                  .withValues(
                                alpha: .22,
                              ),
                            ],
                          ),
                        ),
                      ),
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
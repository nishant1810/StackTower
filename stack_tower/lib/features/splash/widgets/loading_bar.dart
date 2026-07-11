import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({
    super.key,
    required this.progress,
    this.height = 10,
  });

  final Animation<double> progress;
  final double height;

  static const _startColor =
  Color(0xFFFF9800);

  static const _endColor =
  Color(0xFFFFD54F);

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size;

    final barHeight =
    (size.height * 0.012)
        .clamp(8.0, 12.0);

    final textSize =
    (size.width * 0.032)
        .clamp(11.0, 14.0);

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: progress,
        builder: (context, child) {
          final value =
          progress.value.clamp(
            0.0,
            1.0,
          );

          return Column(
            mainAxisSize:
            MainAxisSize.min,
            children: [
              _ProgressBar(
                progress: value,
                height: barHeight,
              ),

              SizedBox(
                height:
                size.height *
                    0.02,
              ),

              Text(
                'LOADING ${(value * 100).round()}%',
                textAlign:
                TextAlign.center,
                style: TextStyle(
                  color:
                  Colors.white70,
                  fontSize:
                  textSize,
                  fontWeight:
                  FontWeight.w600,
                  letterSpacing:
                  textSize * 0.18,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({
    required this.progress,
    required this.height,
  });

  final double progress;
  final double height;

  static const _startColor =
  Color(0xFFFF9800);

  static const _endColor =
  Color(0xFFFFD54F);

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size;

    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius:
        BorderRadius.circular(
          100,
        ),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: progress,
            alignment:
            Alignment.centerLeft,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius
                    .circular(
                  100,
                ),
                gradient:
                const LinearGradient(
                  begin:
                  Alignment
                      .centerLeft,
                  end:
                  Alignment
                      .centerRight,
                  colors: [
                    _startColor,
                    _endColor,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                    _startColor,
                    blurRadius:
                    (size.width *
                        0.05)
                        .clamp(
                      14.0,
                      22.0,
                    ),
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment(
              -1 + progress * 2,
              0,
            ),
            child: Container(
              width: height + 4,
              height: height + 4,
              decoration:
              BoxDecoration(
                shape:
                BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: _endColor
                        .withValues(
                      alpha: 0.9,
                    ),
                    blurRadius:
                    (size.width *
                        0.04)
                        .clamp(
                      12.0,
                      18.0,
                    ),
                    spreadRadius:
                    (size.width *
                        0.006)
                        .clamp(
                      2.0,
                      3.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
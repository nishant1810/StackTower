import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({
    super.key,
    required this.progress,
    this.height = 10,
  });

  final Animation<double> progress;
  final double height;

  static const _startColor = Color(0xFFFF9800);
  static const _endColor = Color(0xFFFFD54F);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: progress,
        builder: (context, child) {
          final value = progress.value.clamp(0.0, 1.0);

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ProgressBar(
                progress: value,
                height: height,
              ),

              const SizedBox(height: 18),

              Text(
                "LOADING ${(value * 100).round()}%",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.5,
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

  static const _startColor = Color(0xFFFF9800);
  static const _endColor = Color(0xFFFFD54F);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: progress,
            alignment: Alignment.centerLeft,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    _startColor,
                    _endColor,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: _startColor,
                    blurRadius: 22,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment(-1 + progress * 2, 0),
            child: Container(
              width: height + 4,
              height: height + 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: _endColor.withValues(alpha: 0.9),
                    blurRadius: 18,
                    spreadRadius: 3,
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
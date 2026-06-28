import 'package:flutter/material.dart';

class ComboProgressBarWidget extends StatelessWidget {
  const ComboProgressBarWidget({
    super.key,
    required this.progress,
  });

  final double progress;

  String get nextMilestone {
    if (progress < 0.25) return 'NEXT: GREAT';
    if (progress < 0.50) return 'NEXT: AMAZING';
    if (progress < 0.75) return 'NEXT: UNSTOPPABLE';
    return 'NEXT: LEGEND';
  }

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFFFFB74D);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.18),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: accentColor.withOpacity(0.35),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 8,
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation(
                accentColor,
              ),
            ),
          ),
        ),

        const SizedBox(height: 4),

        Text(
          nextMilestone,
          style: TextStyle(
            color: accentColor.withOpacity(0.85),
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/neon_title.dart';
import '../widgets/pause_button.dart';
import '../widgets/pause_panel.dart';

class PausePage extends StatelessWidget {
  final VoidCallback onResume;
  final VoidCallback onRestart;
  final VoidCallback onSettings;
  final VoidCallback onHome;

  const PausePage({
    super.key,
    required this.onResume,
    required this.onRestart,
    required this.onSettings,
    required this.onHome,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                color: Colors.black.withValues(
                  alpha: 0.45,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: PausePanel(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const NeonTitle(
                        title: 'PAUSED',
                      ),

                      const SizedBox(height: 30),

                      PauseButton(
                        icon: Icons.play_arrow_rounded,
                        glowColor:
                        const Color(0xFF00D4FF),
                        onTap: onResume,
                      ),

                      const SizedBox(height: 16),

                      PauseButton(
                        icon: Icons.refresh_rounded,
                        glowColor:
                        const Color(0xFFB84DFF),
                        onTap: onRestart,
                      ),

                      const SizedBox(height: 16),

                      PauseButton(
                        icon: Icons.settings_rounded,
                        glowColor:
                        const Color(0xFF8A2EFF),
                        onTap: onSettings,
                      ),

                      const SizedBox(height: 16),

                      PauseButton(
                        icon: Icons.home_rounded,
                        glowColor:
                        const Color(0xFFFFA726),
                        onTap: onHome,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
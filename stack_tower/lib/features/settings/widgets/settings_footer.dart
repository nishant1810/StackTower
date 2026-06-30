import 'package:flutter/material.dart';

class SettingsFooter extends StatelessWidget {
  const SettingsFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(24),
        border: Border.all(
          color: const Color(
            0xFF6F63FF,
          ).withValues(
            alpha: 0.4,
          ),
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0B1033),
            Color(0xFF131A4D),
          ],
        ),
      ),
      child: const Column(
        children: [
          Text(
            'STACK TOWER',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Version 1.0.0',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
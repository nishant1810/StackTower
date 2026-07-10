import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';

class HomeProfileCard extends StatelessWidget {
  final String playerName;
  final String? avatarPath;
  final VoidCallback? onTap;

  const HomeProfileCard({
    super.key,
    required this.playerName,
    this.avatarPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 3.4,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;

            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssets.profileFrame,
                    fit: BoxFit.fill,
                  ),
                ),

                // Avatar
                Positioned(
                  left: w * 0.08,
                  top: h * 0.16,
                  width: h * 0.50,
                  height: h * 0.50,
                  child: ClipOval(
                    child: avatarPath != null &&
                        avatarPath!.isNotEmpty
                        ? Image.asset(
                      avatarPath!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          _buildDefaultAvatar(h),
                    )
                        : _buildDefaultAvatar(h),
                  ),
                ),

                // Player Name
                Positioned(
                  left: w * 0.24,
                  right: w * 0.12,
                  top: h * 0.30,
                  child: Text(
                    playerName.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: h * 0.13,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                      shadows: const [
                        Shadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDefaultAvatar(double h) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF143E7A),
      ),
      child: Icon(
        Icons.person_rounded,
        color: Colors.white,
        size: h * 0.22,
      ),
    );
  }
}
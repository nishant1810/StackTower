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
        aspectRatio: 2.7,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;

            final avatarSize =
            (h * 0.62).clamp(34.0, 56.0);

            final fontSize =
            (h * 0.18).clamp(11.0, 18.0);

            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssets.profileFrame,
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  left: w * 0.07,
                  top: h * 0.18,
                  width: avatarSize,
                  height: avatarSize,
                  child: ClipOval(
                    child: avatarPath != null &&
                        avatarPath!.isNotEmpty
                        ? Image.asset(
                      avatarPath!,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) =>
                          _buildDefaultAvatar(
                            avatarSize,
                          ),
                    )
                        : _buildDefaultAvatar(
                      avatarSize,
                    ),
                  ),
                ),

                Positioned(
                  left: w * 0.25,
                  right: w * 0.08,
                  top: h * 0.30,
                  child: Text(
                    playerName.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
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

  Widget _buildDefaultAvatar(
      double avatarSize,
      ) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF143E7A),
      ),
      child: Icon(
        Icons.person_rounded,
        color: Colors.white,
        size: avatarSize * 0.45,
      ),
    );
  }
}
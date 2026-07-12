import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';

class HomeProfileCard extends StatelessWidget {
  final String playerName;
  final String? avatarPath;
  final String? photoUrl;
  final VoidCallback? onTap;

  const HomeProfileCard({
    super.key,
    required this.playerName,
    this.avatarPath,
    this.photoUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 3.0,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;

            final avatarSize =
            (h * 0.40).clamp(24.0, 38.0);

            final fontSize =
            (h * 0.15).clamp(10.0, 14.0);

            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssets.profileFrame,
                    fit: BoxFit.fill,
                  ),
                ),

                /// Avatar
                Positioned(
                  left: w * 0.06,
                  top: (h - avatarSize) / 2,
                  width: avatarSize,
                  height: avatarSize,
                  child: ClipOval(
                    child: _buildAvatar(
                      avatarSize,
                    ),
                  ),
                ),

                /// Player Name
                Positioned(
                  left: w * 0.18,
                  right: w * 0.08,
                  top: 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      playerName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAvatar(double avatarSize) {
    if (photoUrl != null &&
        photoUrl!.isNotEmpty) {
      return Image.network(
        photoUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return _buildDefaultAvatar(
            avatarSize,
          );
        },
      );
    }

    if (avatarPath != null &&
        avatarPath!.isNotEmpty) {
      return Image.asset(
        avatarPath!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return _buildDefaultAvatar(
            avatarSize,
          );
        },
      );
    }

    return _buildDefaultAvatar(
      avatarSize,
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
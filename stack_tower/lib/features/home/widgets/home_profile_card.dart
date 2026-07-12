import 'package:flutter/material.dart';

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
    final screenHeight =
        MediaQuery.of(context).size.height;

    final cardHeight =
    (screenHeight * 0.05).clamp(20.0, 52.0);

    final avatarSize =
    (cardHeight * 0.65).clamp(24.0, 34.0);

    final fontSize =
    (cardHeight * 0.28).clamp(10.0, 14.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cardHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white.withOpacity(0.05),
          border: Border.all(
            color: const Color(0xFF6C8BFF)
                .withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6C8BFF)
                  .withOpacity(0.12),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF79B8FF),
                  width: 1.5,
                ),
              ),
              child: ClipOval(
                child: _buildAvatar(
                  avatarSize,
                ),
              ),
            ),

            const SizedBox(width: 8),

            Flexible(
              child: Text(
                playerName.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
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
      );
    }

    if (avatarPath != null &&
        avatarPath!.isNotEmpty) {
      return Image.asset(
        avatarPath!,
        fit: BoxFit.cover,
      );
    }

    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFF4D8EFF),
            Color(0xFF6F4DFF),
          ],
        ),
      ),
      child: Icon(
        Icons.person_rounded,
        color: Colors.white,
        size: avatarSize * 0.5,
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SettingsSwitchTile extends StatelessWidget {
  const SettingsSwitchTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final tileHeight =
    (size.height * 0.095).clamp(68.0, 84.0);

    final iconContainerSize =
    (size.width * 0.11).clamp(40.0, 50.0);

    final iconSize =
    (size.width * 0.065).clamp(22.0, 28.0);

    final titleSize =
    (size.width * 0.05).clamp(16.0, 20.0);

    final horizontalPadding =
    (size.width * 0.045).clamp(14.0, 22.0);

    return Container(
      height: tileHeight,
      margin: EdgeInsets.only(
        bottom: size.height * 0.018,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFF7B61FF)
              .withOpacity(0.45),
          width: 1.4,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0B1033),
            Color(0xFF131A4D),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6A5CFF)
                .withOpacity(0.15),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
        ),
        child: Row(
          children: [
            Container(
              width: iconContainerSize,
              height: iconContainerSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor.withOpacity(0.12),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
            ),

            SizedBox(
              width:
              (size.width * 0.04).clamp(
                12.0,
                18.0,
              ),
            ),

            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleSize,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),

            Transform.scale(
              scale: (size.width * 0.0028)
                  .clamp(0.9, 1.1),
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.white,
                activeTrackColor:
                const Color(0xFF7B61FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
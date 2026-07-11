import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final tileHeight =
    (size.height * 0.09).clamp(64.0, 80.0);

    final iconSize =
    (size.width * 0.07).clamp(22.0, 30.0);

    final titleSize =
    (size.width * 0.042).clamp(14.0, 18.0);

    final horizontalPadding =
    (size.width * 0.045).clamp(14.0, 22.0);

    return Padding(
      padding: EdgeInsets.only(
        bottom: size.height * 0.015,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Container(
            height: tileHeight,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFF131A4D),
              border: Border.all(
                color: const Color(0xFF7B61FF)
                    .withOpacity(0.25),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
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
                    overflow:
                    TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white70,
                  size:
                  (iconSize * 0.65).clamp(
                    14.0,
                    18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
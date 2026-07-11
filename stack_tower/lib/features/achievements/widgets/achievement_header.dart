import 'package:flutter/material.dart';

class AchievementHeader extends StatelessWidget {
  const AchievementHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final horizontalPadding =
    (size.width * 0.05).clamp(12.0, 24.0);

    final verticalPadding =
    (size.height * 0.015).clamp(8.0, 16.0);

    final buttonSize =
    (size.width * 0.13).clamp(46.0, 60.0);

    final iconSize =
    (size.width * 0.045).clamp(16.0, 22.0);

    final titleSize =
    (size.width * 0.07).clamp(22.0, 32.0);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: SizedBox(
        height: buttonSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: buttonSize,
                height: buttonSize,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(
                    buttonSize * 0.32,
                  ),
                  gradient:
                  const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF241544),
                      Color(0xFF0C1024),
                    ],
                  ),
                  border: Border.all(
                    color:
                    const Color(0xFF8B5CF6),
                    width: 1.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color:
                      Color(0x668B5CF6),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons
                        .arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
              ),
            ),

            Text(
              'MISSIONS',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow:
              TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: titleSize,
                fontWeight:
                FontWeight.w900,
                letterSpacing:
                titleSize * 0.07,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
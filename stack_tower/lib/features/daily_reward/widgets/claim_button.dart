import 'package:flutter/material.dart';

class ClaimButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;

  const ClaimButton({
    super.key,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final buttonHeight =
    (size.height * 0.075).clamp(58.0, 68.0);

    final iconSize =
    (buttonHeight * 0.55).clamp(32.0, 40.0);

    final textSize =
    (size.width * 0.05).clamp(16.0, 19.0);

    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: enabled ? 1 : .65,
        child: Container(
          height: buttonHeight,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(buttonHeight / 2),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFE08A),
                Color(0xFFFFC857),
                Color(0xFFFFA800),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFFFFC857,
                ).withOpacity(.35),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width:
                (size.width * 0.04).clamp(12.0, 20.0),
              ),

              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.18),
                ),
                child: Icon(
                  Icons.card_giftcard_rounded,
                  color: Colors.white,
                  size: iconSize * 0.5,
                ),
              ),

              SizedBox(
                width:
                (size.width * 0.025).clamp(8.0, 14.0),
              ),

              Expanded(
                child: Text(
                  enabled
                      ? 'CLAIM REWARD'
                      : 'COME BACK TOMORROW',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textSize,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5,
                  ),
                ),
              ),

              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.18),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: iconSize * 0.42,
                ),
              ),

              SizedBox(
                width:
                (size.width * 0.03).clamp(10.0, 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
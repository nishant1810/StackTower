import 'package:flutter/material.dart';

class NeonSwitch extends StatelessWidget {
  final bool value;
  final Color color;
  final ValueChanged<bool> onChanged;

  const NeonSwitch({
    super.key,
    required this.value,
    required this.color,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
        width: 78,
        height: 40,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),

          gradient: value
              ? LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              color.withOpacity(.70),
            ],
          )
              : const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff26324C),
              Color(0xff161E33),
            ],
          ),

          border: Border.all(
            color: value
                ? color.withOpacity(.9)
                : Colors.white24,
            width: 1.4,
          ),

          boxShadow: [

            if (value)
              BoxShadow(
                color: color.withOpacity(.55),
                blurRadius: 26,
                spreadRadius: 2,
              ),

            BoxShadow(
              color: Colors.black.withOpacity(.35),
              blurRadius: 12,
            ),
          ],
        ),

        child: Stack(
          children: [

            /// ON/OFF LABEL
            Positioned.fill(
              child: Align(
                alignment: value
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      color: value
                          ? Colors.white70
                          : Colors.white38,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    child: Text(
                      value ? "ON" : "OFF",
                    ),
                  ),
                ),
              ),
            ),

            /// KNOB
            AnimatedAlign(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutBack,
              alignment: value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Color(0xffDDE4F0),
                    ],
                  ),

                  border: Border.all(
                    color: Colors.white70,
                    width: 1,
                  ),

                  boxShadow: [

                    BoxShadow(
                      color: Colors.white.withOpacity(.35),
                      blurRadius: 14,
                    ),

                    if (value)
                      BoxShadow(
                        color: color.withOpacity(.55),
                        blurRadius: 18,
                      ),
                  ],
                ),

                child: Stack(
                  children: [

                    /// SHINE
                    Positioned(
                      top: 4,
                      left: 6,
                      child: Container(
                        width: 10,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.85),
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                      ),
                    ),

                    Center(
                      child: Icon(
                        value
                            ? Icons.check_rounded
                            : Icons.close_rounded,
                        size: 18,
                        color: value
                            ? color
                            : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
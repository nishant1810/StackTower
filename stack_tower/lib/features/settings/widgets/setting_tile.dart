import 'package:flutter/material.dart';

import 'neon_switch.dart';

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool? value;
  final Color color;

  final ValueChanged<bool>? onChanged;
  final VoidCallback? onTap;

  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    required this.onChanged,
  }) : onTap = null;

  const SettingTile.button({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  })  : value = null,
        onChanged = null;

  bool get isSwitch => value != null;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: isSwitch ? null : onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          height: 96,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff1B2446),
                Color(0xff111A34),
              ],
            ),
            border: Border.all(
              color: color.withOpacity(.65),
              width: 1.6,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(.25),
                blurRadius: 28,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              //------------------------------------
              // ICON
              //------------------------------------

              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(.35),
                      color.withOpacity(.15),
                    ],
                  ),
                  border: Border.all(
                    color: color.withOpacity(.65),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(.30),
                      blurRadius: 18,
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              const SizedBox(width: 18),

              //------------------------------------
              // TITLE
              //------------------------------------

              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5,
                  ),
                ),
              ),

              const SizedBox(width: 18),

              //------------------------------------
              // SWITCH / ARROW
              //------------------------------------

              if (isSwitch)
                NeonSwitch(
                  value: value!,
                  color: color,
                  onChanged: onChanged!,
                )
              else
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        color.withOpacity(.30),
                        color.withOpacity(.10),
                      ],
                    ),
                    border: Border.all(
                      color: color.withOpacity(.55),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(.25),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;

  const GameButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(title),
      ),
    );
  }
}
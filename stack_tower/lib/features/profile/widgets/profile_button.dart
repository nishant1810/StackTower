import 'package:flutter/material.dart';

import '../../profile/pages/profile_page.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfilePage(),
          ),
        );
      },
      child: const CircleAvatar(
        radius: 26,
        child: Icon(Icons.person),
      ),
    );
  }
}
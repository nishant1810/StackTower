import 'package:flutter/material.dart';
import '../../../core/services/storage/storage_service.dart';
import '../../../core/services/auth/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xFF1A2238),
              backgroundImage: AuthService.photoUrl != null
                  ? NetworkImage(AuthService.photoUrl!)
                  : null,
              child: AuthService.photoUrl == null
                  ? Text(
                AuthService.isGuest ? 'G' : 'P',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              )
                  : null,
            ),

            const SizedBox(height: 16),

            Text(
              AuthService.playerName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              user?.email ?? 'Guest Account',
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () async {
                await AuthService.signOut();

                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: Text(
                AuthService.isGuest
                    ? 'Exit Guest Mode'
                    : 'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
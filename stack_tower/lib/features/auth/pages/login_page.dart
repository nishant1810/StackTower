import 'package:flutter/material.dart';
import '../../../core/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;

  Future<void> _signIn() async {
    if (_loading) return;

    setState(() {
      _loading = true;
    });

    try {
      final user = await AuthService.signInWithGoogle();

      if (!mounted) return;

      if (user != null) {
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Google Sign-In was cancelled'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Google Sign-In Failed'),
          duration: const Duration(seconds: 3),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  void _continueAsGuest() {
    AuthService.continueAsGuest();
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081224),
      body: SafeArea(
        child: Center(
          child: _loading
              ? const CircularProgressIndicator()
              : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: _signIn,
                icon: const Icon(Icons.login),
                label: const Text(
                  'Continue with Google',
                ),
              ),

              const SizedBox(height: 16),

              OutlinedButton.icon(
                onPressed: _continueAsGuest,
                icon: const Icon(Icons.person_outline),
                label: const Text(
                  'Continue as Guest',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
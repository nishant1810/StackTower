import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
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
            content: Text(
              'Google Sign-In was cancelled',
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Google Sign-In Failed',
          ),
          duration: Duration(seconds: 3),
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

  Future<void> _continueAsGuest() async {
    if (_loading) return;

    setState(() {
      _loading = true;
    });

    try {
      await AuthService.continueAsGuest();

      if (!mounted) return;

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Unable to continue as guest',
          ),
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.loginBackground,
            fit: BoxFit.cover,
          ),

          // GOOGLE BUTTON AREA
          Positioned(
            left: size.width * 0.12,
            right: size.width * 0.12,
            top: size.height * 0.50,
            child: SizedBox(
              height: size.height * 0.09,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    24,
                  ),
                  onTap: _signIn,
                ),
              ),
            ),
          ),

          // GUEST BUTTON AREA
          Positioned(
            left: size.width * 0.12,
            right: size.width * 0.12,
            top: size.height * 0.63,
            child: SizedBox(
              height: size.height * 0.09,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    24,
                  ),
                  onTap: _continueAsGuest,
                ),
              ),
            ),
          ),

          if (_loading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
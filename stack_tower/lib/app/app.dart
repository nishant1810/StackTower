import 'package:flutter/material.dart';

import '../ui/splash/splash_screen.dart';

class StackTowerApp extends StatelessWidget {
  const StackTowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Tower',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),

      home: const SplashScreen(),
    );
  }
}
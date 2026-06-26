import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

class StackTowerApp extends StatelessWidget {
  const StackTowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Tower',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: AppRouter.initialRoute,
    );
  }
}
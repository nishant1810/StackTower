import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stack_tower/features/achievements/models/achievement_model.dart';
import 'package:stack_tower/features/themes/data/theme_catalog.dart';
import 'package:stack_tower/app/theme/app_theme.dart';

void main() {
  group('ThemeCatalog Tests', () {
    test('contains default themes', () {
      expect(ThemeCatalog.themes.length, greaterThanOrEqualTo(6));
      final skyTheme = ThemeCatalog.getById('sky');
      expect(skyTheme.name, 'Sky Citadel');
      expect(skyTheme.coinCost, 0);
    });

    test('getPalette returns valid color list', () {
      final palette = ThemeCatalog.getPalette('neon');
      expect(palette, isNotEmpty);
    });
  });

  group('AchievementModel Tests', () {
    test('progressPercent computes accurately', () {
      const model = AchievementModel(
        id: 'test_1',
        title: 'Master Stacker',
        description: 'Reach score 50',
        icon: Icons.star,
        target: 50,
        progress: 25,
        unlocked: false,
        reward: 100,
        rewardClaimed: false,
      );

      expect(model.progressPercent, 0.5);
    });
  });

  group('App Theme & Smoke Tests', () {
    testWidgets('App theme configures dark theme with primary styles',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: const Scaffold(
            body: Center(
              child: Text('Stack Tower Ready'),
            ),
          ),
        ),
      );

      expect(find.text('Stack Tower Ready'), findsOneWidget);
    });
  });
}

import 'package:flutter/foundation.dart';

import '../models/achievement.dart';

class AchievementService extends ChangeNotifier {

  AchievementService._();

  static final instance =
  AchievementService._();

  final List<Achievement> _items = [

    Achievement(
      id: "score10",
      title: "Getting Started",
      description: "Reach score 10",
      target: 10,
      reward: 50,
    ),

    Achievement(
      id: "score50",
      title: "Tower Builder",
      description: "Reach score 50",
      target: 50,
      reward: 100,
    ),

    Achievement(
      id: "score100",
      title: "Master Builder",
      description: "Reach score 100",
      target: 100,
      reward: 200,
    ),

    Achievement(
      id: "perfect25",
      title: "Perfect Precision",
      description: "Make 25 perfect blocks",
      target: 25,
      reward: 250,
    ),

    Achievement(
      id: "coins1000",
      title: "Rich Player",
      description: "Collect 1000 coins",
      target: 1000,
      reward: 300,
    ),
  ];

  List<Achievement> get achievements =>
      List.unmodifiable(_items);

  //--------------------------------------------------------

  void updateProgress(
      String id,
      int progress,
      ) {
    final index =
    _items.indexWhere(
          (e) => e.id == id,
    );

    if (index == -1) return;

    final item = _items[index];

    final completed =
        progress >= item.target;

    _items[index] =
        item.copyWith(
          progress: progress,
          completed: completed,
        );

    notifyListeners();
  }

  //--------------------------------------------------------

  int claimReward(
      String id,
      ) {
    final index =
    _items.indexWhere(
          (e) => e.id == id,
    );

    if (index == -1) return 0;

    final item = _items[index];

    if (!item.completed ||
        item.claimed) {
      return 0;
    }

    _items[index] =
        item.copyWith(
          claimed: true,
        );

    notifyListeners();

    return item.reward;
  }
}
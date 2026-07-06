import 'package:flutter/material.dart';

import '../../../core/services/storage/storage_service.dart';

class ShopController extends ChangeNotifier {
  int coins = 0;
  int diamonds = 0;

  Future<void> loadData() async {
    coins = await StorageService.getCoins();
    diamonds = await StorageService.getDiamonds();

    notifyListeners();
  }

  Future<void> buyCoins(int amount) async {
    await StorageService.addCoins(amount);

    coins = await StorageService.getCoins();

    notifyListeners();
  }

  Future<void> buyDiamonds(int amount) async {
    await StorageService.addDiamonds(amount);

    diamonds = await StorageService.getDiamonds();

    notifyListeners();
  }

  Future<void> claimDailyReward() async {
    const rewardAmount = 100;

    await StorageService.addCoins(
      rewardAmount,
    );

    coins = await StorageService.getCoins();

    notifyListeners();
  }
}
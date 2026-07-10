import 'package:flutter/material.dart';

import '../../../core/services/storage/storage_service.dart';

class ShopController extends ChangeNotifier {
  int coins = 0;
  int diamonds = 0;

  bool isLoading = false;

  static const int dailyRewardAmount = 500;
  static const int watchAdRewardAmount = 250;

  Future<void> loadData() async {
    coins = await StorageService.getCoins();
    diamonds = await StorageService.getDiamonds();

    notifyListeners();
  }

  Future<void> refreshBalances() async {
    coins = await StorageService.getCoins();
    diamonds = await StorageService.getDiamonds();

    notifyListeners();
  }

  Future<void> buyCoins(int amount) async {
    isLoading = true;
    notifyListeners();

    await StorageService.addCoins(amount);

    coins = await StorageService.getCoins();

    isLoading = false;
    notifyListeners();
  }

  Future<void> buyDiamonds(int amount) async {
    isLoading = true;
    notifyListeners();

    await StorageService.addDiamonds(amount);

    diamonds = await StorageService.getDiamonds();

    isLoading = false;
    notifyListeners();
  }

  Future<bool> claimDailyReward() async {
    await StorageService.addCoins(
      dailyRewardAmount,
    );

    coins = await StorageService.getCoins();

    notifyListeners();

    return true;
  }

  Future<void> claimWatchAdReward() async {
    await StorageService.addCoins(
      watchAdRewardAmount,
    );

    coins = await StorageService.getCoins();

    notifyListeners();
  }

  Future<void> addCoins(int amount) async {
    await StorageService.addCoins(amount);

    coins = await StorageService.getCoins();

    notifyListeners();
  }

  Future<void> addDiamonds(int amount) async {
    await StorageService.addDiamonds(amount);

    diamonds = await StorageService.getDiamonds();

    notifyListeners();
  }

  Future<void> purchaseRemoveAds() async {
    // TODO:
    // AdMob remove ads implementation
  }
}
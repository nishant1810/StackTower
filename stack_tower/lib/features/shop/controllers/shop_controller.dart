import 'package:flutter/foundation.dart';

import '../../services/storage_service.dart';

class ShopController extends ChangeNotifier {
  int _coins = 0;
  int _diamonds = 0;

  int get coins => _coins;
  int get diamonds => _diamonds;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    _coins = await StorageService.getCoins();
    _diamonds = await StorageService.getDiamonds();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await initialize();
  }

  Future<void> addCoins(int amount) async {
    _coins += amount;
    await StorageService.saveCoins(_coins);
    notifyListeners();
  }

  Future<void> addDiamonds(int amount) async {
    _diamonds += amount;
    await StorageService.saveDiamonds(_diamonds);
    notifyListeners();
  }

  Future<bool> spendCoins(int amount) async {
    if (_coins < amount) {
      return false;
    }

    _coins -= amount;
    await StorageService.saveCoins(_coins);
    notifyListeners();

    return true;
  }

  Future<bool> spendDiamonds(int amount) async {
    if (_diamonds < amount) {
      return false;
    }

    _diamonds -= amount;
    await StorageService.saveDiamonds(_diamonds);
    notifyListeners();

    return true;
  }

  /// Buy Coins using Diamonds
  Future<bool> buyCoinPack({
    required int coinAmount,
    required int diamondCost,
  }) async {
    if (_diamonds < diamondCost) {
      return false;
    }

    _diamonds -= diamondCost;
    _coins += coinAmount;

    await StorageService.saveDiamonds(_diamonds);
    await StorageService.saveCoins(_coins);

    notifyListeners();
    return true;
  }

  /// Buy Diamonds using Coins
  Future<bool> buyDiamondPack({
    required int diamondAmount,
    required int coinCost,
  }) async {
    if (_coins < coinCost) {
      return false;
    }

    _coins -= coinCost;
    _diamonds += diamondAmount;

    await StorageService.saveCoins(_coins);
    await StorageService.saveDiamonds(_diamonds);

    notifyListeners();
    return true;
  }

  /// Rewarded Ad Reward
  Future<void> rewardUser({
    int coins = 0,
    int diamonds = 0,
  }) async {
    _coins += coins;
    _diamonds += diamonds;

    await StorageService.saveCoins(_coins);
    await StorageService.saveDiamonds(_diamonds);

    notifyListeners();
  }
}
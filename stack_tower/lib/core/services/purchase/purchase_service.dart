import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

import '../storage/storage_service.dart';

class PurchaseService {
  PurchaseService._();

  static final PurchaseService instance =
  PurchaseService._();

  final InAppPurchase _iap =
      InAppPurchase.instance;

  StreamSubscription<List<PurchaseDetails>>?
  _subscription;

  static const Set<String> productIds = {
    // Coin Packs
    'stack_coins_1000',
    'stack_coins_5000',
    'stack_coins_12000',
    'stack_coins_30000',

    // Diamond Packs
    'stack_diamonds_50',
    'stack_diamonds_150',
    'stack_diamonds_400',
    'stack_diamonds_1200',
  };

  List<ProductDetails> products = [];

  Future<void> initialize() async {
    try {
      final available =
      await _iap.isAvailable();

      if (!available) {
        print(
          'Billing unavailable',
        );
        return;
      }

      final response =
      await _iap.queryProductDetails(
        productIds,
      );

      print(
        '========================',
      );
      print('FOUND PRODUCTS');
      print(
        '========================',
      );

      for (final p
      in response.productDetails) {
        print(
          'Product: ${p.id}',
        );
      }

      print(
        '========================',
      );
      print('NOT FOUND PRODUCTS');
      print(
        '========================',
      );

      for (final id
      in response.notFoundIDs) {
        print(id);
      }

      products =
          response.productDetails;

      print(
        'Total products loaded: ${products.length}',
      );

      _subscription =
          _iap.purchaseStream.listen(
            _handlePurchases,
            onError: (error) {
              print(
                'PURCHASE ERROR: $error',
              );
            },
          );
    } catch (e) {
      print(
        'PURCHASE INIT ERROR: $e',
      );
    }
  }

  Future<void> buyProduct(
      String productId,
      ) async {
    print(
      'Attempting purchase: $productId',
    );

    print(
      'Loaded products count: ${products.length}',
    );

    for (final p in products) {
      print(
        'Available Product: ${p.id}',
      );
    }

    try {
      final product =
      products.firstWhere(
            (p) => p.id == productId,
      );

      final purchaseParam =
      PurchaseParam(
        productDetails: product,
      );

      await _iap.buyConsumable(
        purchaseParam: purchaseParam,
      );
    } catch (e) {
      print(
        'Product not found: $productId',
      );
      print(e);
    }
  }

  Future<void> _handlePurchases(
      List<PurchaseDetails> purchases,
      ) async {
    for (final purchase
    in purchases) {
      print(
        'Purchase Status: ${purchase.status}',
      );

      switch (purchase.status) {
        case PurchaseStatus.pending:
          print(
            'Purchase pending',
          );
          break;

        case PurchaseStatus.error:
          print(
            'Purchase error: ${purchase.error}',
          );
          break;

        case PurchaseStatus.canceled:
          print(
            'Purchase canceled',
          );
          break;

        case PurchaseStatus.purchased:
          print(
            'PURCHASE SUCCESS',
          );
          print(
            'Product ID: ${purchase.productID}',
          );

          await _grantReward(
            purchase.productID,
          );

          print(
            'REWARD GRANTED',
          );
          break;

        case PurchaseStatus.restored:
          print(
            'PURCHASE RESTORED',
          );
          print(
            'Product ID: ${purchase.productID}',
          );

          await _grantReward(
            purchase.productID,
          );
          break;
      }

      if (purchase
          .pendingCompletePurchase) {
        await _iap.completePurchase(
          purchase,
        );
      }
    }
  }

  Future<void> _grantReward(
      String productId,
      ) async {
    print(
      'Granting reward for: $productId',
    );

    switch (productId) {
      case 'stack_coins_1000':
        await StorageService.addCoins(
          1000,
        );
        break;

      case 'stack_coins_5000':
        await StorageService.addCoins(
          5000,
        );
        break;

      case 'stack_coins_12000':
        await StorageService.addCoins(
          12000,
        );
        break;

      case 'stack_coins_30000':
        await StorageService.addCoins(
          30000,
        );
        break;

      case 'stack_diamonds_50':
        await StorageService
            .addDiamonds(50);
        break;

      case 'stack_diamonds_150':
        await StorageService
            .addDiamonds(150);
        break;

      case 'stack_diamonds_400':
        await StorageService
            .addDiamonds(400);
        break;

      case 'stack_diamonds_1200':
        await StorageService
            .addDiamonds(1200);
        break;

      default:
        print(
          'Unknown product: $productId',
        );
        return;
    }

    final coins =
    await StorageService.getCoins();

    final diamonds =
    await StorageService
        .getDiamonds();

    print(
      'Updated Coins: $coins',
    );
    print(
      'Updated Diamonds: $diamonds',
    );
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
  }
}
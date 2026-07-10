import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdService {
  static RewardedAd? _rewardedAd;
  static bool _isLoading = false;

  static bool get isAdReady => _rewardedAd != null;

  static Future<void> loadAd() async {
    if (_isLoading || _rewardedAd != null) return;

    _isLoading = true;

    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isLoading = false;

          debugPrint('Rewarded Ad Loaded');
        },
        onAdFailedToLoad: (error) {
          _rewardedAd = null;
          _isLoading = false;

          debugPrint(
            'Rewarded Ad Load Failed: $error',
          );
        },
      ),
    );
  }

  static Future<bool> showAd({
    required Future<void> Function() onRewardEarned,
  }) async {
    if (_rewardedAd == null) {
      debugPrint('Rewarded Ad Not Ready');

      await loadAd();
      return false;
    }

    final completer = Completer<bool>();

    final ad = _rewardedAd!;
    _rewardedAd = null;

    bool rewardGiven = false;

    ad.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            ad.dispose();
            loadAd();

            if (!completer.isCompleted) {
              completer.complete(rewardGiven);
            }
          },
          onAdFailedToShowFullScreenContent: (
              ad,
              error,
              ) {
            ad.dispose();
            loadAd();

            debugPrint(
              'Rewarded Ad Show Failed: $error',
            );

            if (!completer.isCompleted) {
              completer.complete(false);
            }
          },
        );

    await ad.show(
      onUserEarnedReward: (
          AdWithoutView ad,
          RewardItem reward,
          ) async {
        rewardGiven = true;

        debugPrint(
          'Reward Earned: ${reward.amount}',
        );

        await onRewardEarned();
      },
    );

    return completer.future;
  }

  static void dispose() {
    _rewardedAd?.dispose();
    _rewardedAd = null;
  }
}
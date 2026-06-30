import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  AdService._();

  static InterstitialAd? _interstitialAd;
  static bool _isInterstitialReady = false;

  static RewardedAd? _rewardedAd;
  static bool _isRewardedReady = false;

  static int _gamesPlayed = 0;

  // =========================================================
  // INITIALIZE
  // =========================================================

  static Future<void> initialize() async {
    loadInterstitial();
    loadRewardedAd();
  }

  // =========================================================
  // GAME OVER COUNTER
  // =========================================================

  static void onGameOver() {
    _gamesPlayed++;

    if (_gamesPlayed % 3 == 0) {
      showInterstitial();
    }
  }

  // =========================================================
  // LOAD INTERSTITIAL
  // =========================================================

  static void loadInterstitial() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialReady = true;
        },
        onAdFailedToLoad: (error) {
          _isInterstitialReady = false;
          debugPrint(
            'Interstitial failed: ${error.message}',
          );
        },
      ),
    );
  }

  // =========================================================
  // LOAD REWARDED
  // =========================================================

  static void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedReady = true;
        },
        onAdFailedToLoad: (error) {
          _isRewardedReady = false;
          debugPrint(
            'Rewarded failed: ${error.message}',
          );
        },
      ),
    );
  }

  // =========================================================
  // SHOW INTERSTITIAL
  // =========================================================

  static void showInterstitial() {
    if (!_isInterstitialReady ||
        _interstitialAd == null) {
      return;
    }

    _interstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            ad.dispose();

            _interstitialAd = null;
            _isInterstitialReady = false;

            loadInterstitial();
          },
          onAdFailedToShowFullScreenContent:
              (ad, error) {
            ad.dispose();

            _interstitialAd = null;
            _isInterstitialReady = false;

            loadInterstitial();
          },
        );

    _interstitialAd!.show();
  }

  // =========================================================
  // SHOW REWARDED
  // =========================================================

  static void showRewardedAd({
    required VoidCallback onRewardEarned,
  }) {
    if (!_isRewardedReady ||
        _rewardedAd == null) {
      return;
    }

    _rewardedAd!.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            ad.dispose();

            _rewardedAd = null;
            _isRewardedReady = false;

            loadRewardedAd();
          },
          onAdFailedToShowFullScreenContent:
              (ad, error) {
            ad.dispose();

            _rewardedAd = null;
            _isRewardedReady = false;

            loadRewardedAd();
          },
        );

    _rewardedAd!.show(
      onUserEarnedReward: (
          AdWithoutView ad,
          RewardItem reward,
          ) {
        onRewardEarned();
      },
    );
  }

  // =========================================================
  // DISPOSE
  // =========================================================

  static void dispose() {
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();

    _interstitialAd = null;
    _rewardedAd = null;

    _isInterstitialReady = false;
    _isRewardedReady = false;
  }
}
import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_ids.dart';

class InterstitialManager {
  InterstitialAd? _ad;

  bool _isLoading = false;

  bool get isLoaded => _ad != null;

  //==========================================================
  // LOAD
  //==========================================================

  Future<void> load() async {
    if (_isLoading || _ad != null) return;

    _isLoading = true;

    InterstitialAd.load(
      adUnitId: AdIds.interstitial,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _isLoading = false;

          _ad = ad;

          _setupCallbacks(ad);

          log("Interstitial Loaded");
        },

        onAdFailedToLoad: (error) {
          _isLoading = false;

          _ad = null;

          log(
            "Interstitial Failed : ${error.message}",
          );
        },
      ),
    );
  }

  //==========================================================
  // SHOW
  //==========================================================

  Future<bool> show() async {
    if (_ad == null) {
      await load();
      return false;
    }

    _ad!.show();

    return true;
  }

  //==========================================================
  // CALLBACKS
  //==========================================================

  void _setupCallbacks(
      InterstitialAd ad,
      ) {
    ad.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            ad.dispose();

            _ad = null;

            load();
          },

          onAdFailedToShowFullScreenContent:
              (ad, error) {
            ad.dispose();

            _ad = null;

            load();

            log(
              "Interstitial Show Error : ${error.message}",
            );
          },

          onAdShowedFullScreenContent: (_) {
            log(
              "Interstitial Showing",
            );
          },
        );
  }

  //==========================================================
  // DISPOSE
  //==========================================================

  void dispose() {
    _ad?.dispose();

    _ad = null;
  }
}
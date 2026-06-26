import 'dart:async';
import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_ids.dart';

class RewardedManager {
  RewardedAd? _ad;

  bool _isLoading = false;

  bool get isLoaded => _ad != null;

  //==========================================================
  // LOAD
  //==========================================================

  Future<void> load() async {
    if (_isLoading || _ad != null) return;

    _isLoading = true;

    RewardedAd.load(
      adUnitId: AdIds.rewarded,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _isLoading = false;

          _ad = ad;

          _setupCallbacks(ad);

          log("Rewarded Ad Loaded");
        },

        onAdFailedToLoad: (error) {
          _isLoading = false;

          _ad = null;

          log(
            "Rewarded Load Failed : ${error.message}",
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

    final completer = Completer<bool>();

    bool rewarded = false;

    _ad!.show(
      onUserEarnedReward: (_, __) {
        rewarded = true;
      },
    );

    _ad!.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            ad.dispose();

            _ad = null;

            load();

            if (!completer.isCompleted) {
              completer.complete(rewarded);
            }
          },

          onAdFailedToShowFullScreenContent:
              (ad, error) {
            ad.dispose();

            _ad = null;

            load();

            if (!completer.isCompleted) {
              completer.complete(false);
            }

            log(
              "Rewarded Show Failed : ${error.message}",
            );
          },
        );

    return completer.future;
  }

  //==========================================================
  // CALLBACKS
  //==========================================================

  void _setupCallbacks(
      RewardedAd ad,
      ) {
    ad.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdShowedFullScreenContent: (_) {
            log("Rewarded Showing");
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
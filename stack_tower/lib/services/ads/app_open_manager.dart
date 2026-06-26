import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_ids.dart';

class AppOpenManager with WidgetsBindingObserver {
  AppOpenAd? _appOpenAd;

  bool _isLoading = false;
  bool _isShowing = false;

  DateTime? _loadTime;

  static const Duration maxCacheAge = Duration(hours: 4);

  //==========================================================
  // INITIALIZE
  //==========================================================

  void initialize() {
    WidgetsBinding.instance.addObserver(this);

    load();
  }

  //==========================================================
  // LOAD
  //==========================================================

  Future<void> load() async {
    if (_isLoading || _appOpenAd != null) {
      return;
    }

    _isLoading = true;

    AppOpenAd.load(
      adUnitId: AdIds.appOpen,
      request: const AdRequest(),
      orientation: AppOpenAd.orientationPortrait,
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;

          _loadTime = DateTime.now();

          _isLoading = false;

          _registerCallbacks(ad);

          log("App Open Loaded");
        },

        onAdFailedToLoad: (error) {
          _isLoading = false;

          _appOpenAd = null;

          log(
            "App Open Failed : ${error.message}",
          );
        },
      ),
    );
  }

  //==========================================================
  // SHOW
  //==========================================================

  Future<void> showIfAvailable() async {
    if (_isShowing) return;

    if (_appOpenAd == null) {
      await load();
      return;
    }

    if (_loadTime == null ||
        DateTime.now().difference(_loadTime!) >
            maxCacheAge) {
      _appOpenAd?.dispose();

      _appOpenAd = null;

      await load();

      return;
    }

    _isShowing = true;

    await _appOpenAd!.show();
  }

  //==========================================================
  // CALLBACKS
  //==========================================================

  void _registerCallbacks(AppOpenAd ad) {
    ad.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            ad.dispose();

            _appOpenAd = null;

            _isShowing = false;

            load();
          },

          onAdFailedToShowFullScreenContent:
              (ad, error) {
            ad.dispose();

            _appOpenAd = null;

            _isShowing = false;

            load();

            log(
              "App Open Show Failed : ${error.message}",
            );
          },

          onAdShowedFullScreenContent: (_) {
            log("App Open Showing");
          },
        );
  }

  //==========================================================
  // APP LIFECYCLE
  //==========================================================

  @override
  void didChangeAppLifecycleState(
      AppLifecycleState state,
      ) {
    if (state == AppLifecycleState.resumed) {
      showIfAvailable();
    }
  }

  //==========================================================
  // DISPOSE
  //==========================================================

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _appOpenAd?.dispose();

    _appOpenAd = null;
  }
}
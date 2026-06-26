import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_ids.dart';

class BannerManager extends ChangeNotifier {
  BannerAd? _banner;

  bool _isLoading = false;

  bool get isLoaded => _banner != null;

  BannerAd? get banner => _banner;

  //==========================================================
  // LOAD
  //==========================================================

  Future<void> load() async {
    if (_isLoading || _banner != null) return;

    _isLoading = true;

    final ad = BannerAd(
      adUnitId: AdIds.banner,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          _isLoading = false;

          _banner = ad;

          notifyListeners();
        },

        onAdFailedToLoad: (ad, error) {
          ad.dispose();

          _isLoading = false;

          _banner = null;

          notifyListeners();
        },
      ),
    );

    await ad.load();
  }

  //==========================================================
  // WIDGET
  //==========================================================

  Widget build() {
    if (_banner == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: _banner!.size.width.toDouble(),
      height: _banner!.size.height.toDouble(),
      child: AdWidget(
        ad: _banner!,
      ),
    );
  }

  //==========================================================
  // REMOVE
  //==========================================================

  void remove() {
    _banner?.dispose();

    _banner = null;

    notifyListeners();
  }

  //==========================================================
  // DISPOSE
  //==========================================================

  @override
  void dispose() {
    _banner?.dispose();

    super.dispose();
  }
}
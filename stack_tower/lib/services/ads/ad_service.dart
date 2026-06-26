import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app_open_manager.dart';
import 'banner_manager.dart';
import 'interstitial_manager.dart';
import 'rewarded_manager.dart';

class AdService {
  AdService._();

  static final instance = AdService._();

  final banner = BannerManager();

  final interstitial = InterstitialManager();

  final rewarded = RewardedManager();

  final appOpen = AppOpenManager();

  Future<void> initialize() async {
    await MobileAds.instance.initialize();

    await interstitial.load();

    await rewarded.load();

    await appOpen.load();
  }
}
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  static RewardedAd? rewardedAd;

  static Future<void> loadRewardedAd() async {
    await RewardedAd.load(
      adUnitId: RewardedAd.testAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback:
      RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          rewardedAd = null;
        },
      ),
    );
  }

  static void showRewardedAd(
      Function() onReward) {
    if (rewardedAd == null) {
      return;
    }

    rewardedAd!.show(
      onUserEarnedReward:
          (ad, reward) {
        onReward();
      },
    );

    rewardedAd = null;

    loadRewardedAd();
  }
}
import 'dart:io';

class AdIds {
  AdIds._();

  //------------------------------------------------------------
  // TEST IDS
  //------------------------------------------------------------

  static String get banner {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }

    return 'ca-app-pub-3940256099942544/2934735716';
  }

  static String get interstitial {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }

    return 'ca-app-pub-3940256099942544/4411468910';
  }

  static String get rewarded {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    }

    return 'ca-app-pub-3940256099942544/1712485313';
  }

  static String get appOpen {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/9257395921';
    }

    return '';
  }
}
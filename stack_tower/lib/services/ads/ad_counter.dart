class AdCounter {

  int gameOvers = 0;

  bool shouldShowInterstitial() {
    gameOvers++;

    return gameOvers % 3 == 0;
  }

  void reset() {
    gameOvers = 0;
  }

}
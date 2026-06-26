import 'dart:convert';

class CloudSaveData {
  const CloudSaveData({
    required this.bestScore,
    required this.coins,
    required this.gems,
    required this.selectedTheme,
    required this.rewardDay,
    required this.lastRewardDate,
  });

  final int bestScore;
  final int coins;
  final int gems;

  final String selectedTheme;

  final int rewardDay;

  final String lastRewardDate;

  Map<String, dynamic> toJson() {
    return {
      "bestScore": bestScore,
      "coins": coins,
      "gems": gems,
      "selectedTheme": selectedTheme,
      "rewardDay": rewardDay,
      "lastRewardDate": lastRewardDate,
    };
  }

  factory CloudSaveData.fromJson(
      Map<String, dynamic> json) {
    return CloudSaveData(
      bestScore: json["bestScore"],
      coins: json["coins"],
      gems: json["gems"],
      selectedTheme: json["selectedTheme"],
      rewardDay: json["rewardDay"],
      lastRewardDate: json["lastRewardDate"],
    );
  }

  String encode() =>
      jsonEncode(toJson());

  factory CloudSaveData.decode(
      String source) {
    return CloudSaveData.fromJson(
      jsonDecode(source),
    );
  }
}
import 'dart:developer';

import '../../models/cloud_save_data.dart';
import '../../services/storage_service.dart';

class CloudSave {
  CloudSave._();

  static final instance =
  CloudSave._();

  //--------------------------------------------------------
  // Upload
  //--------------------------------------------------------

  Future<void> upload() async {
    final data = CloudSaveData(
      bestScore:
      await StorageService.getBestScore(),

      coins:
      await StorageService.getCoins(),

      gems:
      await StorageService.getGems(),

      selectedTheme:
      await StorageService.getTheme(),

      rewardDay:
      await StorageService.getRewardDay(),

      lastRewardDate:
      await StorageService
          .getRewardDate(),
    );

    final json = data.encode();

    try {
      // TODO:
      // Replace with Saved Games API.
      //
      // await GamesServices.saveGame(
      //     "stack_tower",
      //     json);

      log("Cloud Upload Success");
    } catch (e) {
      log("Cloud Upload Failed : $e");
    }
  }

  //--------------------------------------------------------
  // Download
  //--------------------------------------------------------

  Future<void> restore() async {
    try {
      // TODO:
      // final json =
      // await GamesServices.loadGame(
      // "stack_tower");

      // if(json==null)return;

      // final data =
      // CloudSaveData.decode(json);

      // Save locally...

    } catch (e) {
      log(
        "Cloud Restore Failed : $e",
      );
    }
  }
}
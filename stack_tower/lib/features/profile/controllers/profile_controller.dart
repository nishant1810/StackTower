import '../../../core/services/auth/auth_service.dart';
import '../../../core/services/storage/storage_service.dart';
import '../models/player_profile.dart';

class ProfileController {
  const ProfileController();

  Future<PlayerProfile> loadProfile() async {
    final bestScore =
    await StorageService.getBestScore();

    final coins =
    await StorageService.getCoins();

    final gamesPlayed =
    await StorageService.getGamesPlayed();

    final perfectRecord =
    await StorageService.getPerfectRecord();

    final highestCombo =
    await StorageService.getHighestCombo();

    final savedPlayerName =
    await StorageService.getPlayerName();

    final totalXp =
    await StorageService.getTotalXp();

    final level =
        (totalXp ~/ 1000) + 1;

    final xpRequired =
        level * 1000;

    final user = AuthService.currentUser;

    return PlayerProfile(
      name: user?.displayName?.isNotEmpty == true
          ? user!.displayName!
          : savedPlayerName,
      avatar: user?.photoURL ?? '',
      level: level,
      xp: totalXp,
      xpRequired: xpRequired,
      bestScore: bestScore,
      totalCoins: coins,
      gamesPlayed: gamesPlayed,
      perfectRecord: perfectRecord,
      highestCombo: highestCombo,
    );
  }
}
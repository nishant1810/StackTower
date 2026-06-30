import '../../../core/services/storage/storage_service.dart';
import '../models/personal_score.dart';

class PersonalLeaderboardController {
  Future<List<PersonalScore>>
  loadLeaderboard() async {
    final scores =
    await StorageService.getTopScores();

    return List.generate(
      scores.length,
          (index) => PersonalScore(
        rank: index + 1,
        score: scores[index],
      ),
    );
  }
}
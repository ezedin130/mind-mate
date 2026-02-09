import 'package:mindmate/model/mood_models.dart';
import 'package:mindmate/service/mood_service.dart';
import 'package:intl/intl.dart';

class MoodController {
  final MoodService _service = MoodService();

  Future<MoodSubmitResult> submitMood(
      String userId,
      String mood,
      ) async {
    try {
      await _service.submitMood(userId, mood);
      return MoodSubmitResult(
        success: true,
        message: "Mood submitted successfully",
      );
    } catch (_) {
      return MoodSubmitResult(
        success: false,
        message: "Unable to submit mood",
      );
    }
  }

  Future<MoodStreak> getStreak(String userId) async {
    final data = await _service.getMoodStreak(userId);
    return MoodStreak.fromJson(data);
  }

  Future<MoodAverage> getWeeklyAverage(String userId) async {
    final data = await _service.getAverageMood(userId);
    return MoodAverage.fromJson(data);
  }

  String mapScoreToMood(double? score) {
    if (score == null) return "N/A";

    if (score <= 1.5) return "Great";
    if (score <= 2.5) return "Good";
    if (score <= 3.5) return "Okay";
    if (score <= 4.5) return "Sad";
    return "Stressed";
  }
  Future<List<Mood>> getRecentMoods(String userId) async {
    final moods = await _service.getRecentMoods(userId);
    moods.sort((a, b) => b.date.compareTo(a.date));
    return moods;
  }

  String mapDateToLabel(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date).inDays;

    if (diff == 0) return "Today";
    if (diff == 1) return "Yesterday";

    // For older dates, show the day name, e.g., Saturday, Friday
    return DateFormat('EEEE').format(date);
  }
}

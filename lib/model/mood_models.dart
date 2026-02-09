class MoodSubmitResult {
  final bool success;
  final String message;

  MoodSubmitResult({
    required this.success,
    required this.message,
  });
}

class MoodStreak {
  final int streak;

  MoodStreak(this.streak);

  factory MoodStreak.fromJson(Map<String, dynamic> json) {
    return MoodStreak(json['streak'] ?? 0);
  }
}

class MoodAverage {
  final double? averageScore;
  final int entries;

  MoodAverage({
    this.averageScore,
    required this.entries,
  });

  factory MoodAverage.fromJson(Map<String, dynamic> json) {
    return MoodAverage(
      averageScore: json['averageScore'] != null
          ? (json['averageScore'] as num).toDouble()
          : null,
      entries: json['entries'] ?? 0,
    );
  }
}
class Mood {
  final String mood;
  final DateTime date;

  Mood({required this.mood, required this.date});

  factory Mood.fromJson(Map<String, dynamic> json) {
    return Mood(
      mood: json['mood'] ?? 'N/A',
      date: DateTime.parse(json['date']),
    );
  }
}



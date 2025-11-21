class MoodData {
  final String day;
  final String mood;
  final int score;

  const MoodData({
    required this.day,
    required this.mood,
    required this.score,
  });
  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'mood': mood,
      'score': score,
    };
  }

  factory MoodData.fromJson(Map<String, dynamic> json) {
    return MoodData(
      day: json['day'],
      mood: json['mood'],
      score: json['score'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MoodData &&
              runtimeType == other.runtimeType &&
              day == other.day &&
              mood == other.mood &&
              score == other.score;

  @override
  int get hashCode => day.hashCode ^ mood.hashCode ^ score.hashCode;
}
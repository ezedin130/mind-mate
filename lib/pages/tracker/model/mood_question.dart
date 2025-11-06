class MoodQuestion {
  final String question;
  final List<String> options;
  final List<int> scores;

  MoodQuestion({
    required this.question,
    required this.options,
    required this.scores,
  });
}
final List<MoodQuestion> moodQuestions = [
  MoodQuestion(
    question: "How often have you felt anxious or stressed today?",
    options: ["Not at all", "A little", "Sometimes", "Often", "Very often"],
    scores: [1, 2, 3, 4, 5],
  ),
  MoodQuestion(
    question: "How happy do you feel right now?",
    options: ["Very unhappy", "Unhappy", "Neutral", "Happy", "Very happy"],
    scores: [1, 2, 3, 4, 5],
  ),
  MoodQuestion(
    question: "Did you find it easy to concentrate today?",
    options: ["Not at all", "A little", "Somewhat", "Mostly", "Completely"],
    scores: [1, 2, 3, 4, 5],
  ),
];

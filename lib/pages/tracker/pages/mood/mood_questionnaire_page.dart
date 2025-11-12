import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/mood_question.dart';
import 'mood_result_page.dart';

class MoodQuestionnairePage extends StatefulWidget {
  const MoodQuestionnairePage({super.key});

  @override
  _MoodQuestionnairePageState createState() => _MoodQuestionnairePageState();
}

class _MoodQuestionnairePageState extends State<MoodQuestionnairePage> {
  int currentQuestionIndex = 0;
  List<int> answers = [];

  void _nextQuestion(int score) {
    answers.add(score);
    if (currentQuestionIndex < moodQuestions.length - 1) {
      setState(() => currentQuestionIndex++);
    } else {
      _calculateMood();
    }
  }
  void _calculateMood() {
    final totalScore = answers.reduce((a, b) => a + b);
    String mood;
    String suggestion;

    if (totalScore <= 6) {
      mood = "Sad / Low Mood";
      suggestion = "Try taking a short walk or journaling your thoughts.";
    } else if (totalScore <= 10) {
      mood = "Neutral";
      suggestion = "You seem balanced. Maybe listen to some music or meditate.";
    } else {
      mood = "Happy / Positive Mood";
      suggestion = "Keep it up! Share your positivity with others.";
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoodResultPage(
          mood: mood,
          suggestion: suggestion,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = moodQuestions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / moodQuestions.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4957),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E4957), Color(0xFF0D1C26)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white24,
                    color: Colors.tealAccent,
                    minHeight: 10,
                  ),
                ),
                const SizedBox(height: 25),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: Container(
                    key: ValueKey(question.question),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(color: Colors.white24, width: 1),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Question ${currentQuestionIndex + 1} of ${moodQuestions.length}",
                          style: GoogleFonts.lato(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          question.question,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: question.options.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.tealAccent.withOpacity(0.2),
                            foregroundColor: Colors.white,
                            shadowColor: Colors.black.withOpacity(0.4),
                            elevation: 3,
                            minimumSize: const Size(double.infinity, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: const BorderSide(color: Colors.white24),
                            ),
                          ),
                          onPressed: () => _nextQuestion(question.scores[index]),
                          child: Text(
                            question.options[index],
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "Take a deep breath 🌿",
                    style: GoogleFonts.lato(
                      color: Colors.white54,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mindmate/controller/mood_controller.dart';
import 'package:mindmate/service/mood_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../util/color_utils.dart';

class QuickMoodContent extends StatefulWidget {
  @override
  State<QuickMoodContent> createState() => _QuickMoodContentState();
}

class _QuickMoodContentState extends State<QuickMoodContent> {
  String? _selectedMood;
  String? _userId;
  int? _streak;
  String? _averageMood;
  bool _loadingInsights = true;
  final moodController = MoodController();

  @override
  void initState() {
    super.initState();
    _loadUserIdAndInsights();
  }

  Future<void> _loadUserIdAndInsights() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    if (token != null) {
      final decodedToken = JwtDecoder.decode(token);
      final userId = decodedToken['_id'];

      setState(() {
        _userId = userId;
      });
      final streak = await moodController.getStreak(userId);
      final average = await moodController.getWeeklyAverage(userId);
      final averageMoodString = moodController.mapScoreToMood(average.averageScore);

      setState(() {
        _streak = streak.streak;
        _averageMood = averageMoodString;
        _loadingInsights = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMoodSelection(),
        _buildWeeklyInsights(),
      ],
    );
  }

  Widget _buildMoodSelection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Select Your Mood",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMoodOption("Great", "😊"),
                    _buildMoodOption("Good", "🙂"),
                    _buildMoodOption("Okay", "😐"),
                    _buildMoodOption("Sad", "😔"),
                    _buildMoodOption("Stressed", "😫"),
                  ],
                ),
                const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: (_selectedMood != null && _userId != null)
                        ?() async {
                        final result =
                        await moodController.submitMood(_userId!, _selectedMood!);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(result.message)),
                        );

                        if (result.success) {
                          setState(() => _selectedMood = null);
                        }
                      }
                      :null,
                      child: Text("Confirm Mood"),
                    ),
                  ),
              ],
            ),
          ),

        ],
      ),
    );
  }

//quick mood
  Widget _buildMoodOption(String label, String emoji) {
    bool isSelected = _selectedMood == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMood = label;
        });
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

//quick mood
  Widget _buildWeeklyInsights() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "💬 This Week's Insights",
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          _loadingInsights
              ? const Center(child: CircularProgressIndicator())
              : Row(
            children: [
              Expanded(
                child: _buildInsightItem(
                  "Average Mood",
                  _averageMood ?? "N/A",
                ),
              ),
              Expanded(
                child: _buildInsightItem(
                  "Check-in Streak",
                  _streak != null ? "$_streak days" : "N/A",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//quick mood
  Widget _buildInsightItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E4957),
          ),
        ),
      ],
    );
  }


}

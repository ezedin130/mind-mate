import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/color_utils.dart';

class QuickMoodContent extends StatelessWidget {
  const QuickMoodContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMoodSelection(),
        _buildWeeklyInsights(),
        _buildRecentCheckins(),
      ],
    );
  }
  Widget _buildMoodSelection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );
  }
//quick mood
  Widget _buildMoodOption(String label, String emoji) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[100],
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
          Row(
            children: [
              Expanded(
                child: _buildInsightItem("Average Mood", "Good"),
              ),
              Expanded(
                child: _buildInsightItem("Check-in Streak", "5 days"),
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
//quick mood
  Widget _buildRecentCheckins() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Check-ins",
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildCheckinItem("Today", "Good"),
              _buildCheckinItem("Yesterday", "Great"),
              _buildCheckinItem("Nov 9", "Okay"),
              _buildCheckinItem("Nov 8", "Good"),
              _buildCheckinItem("Nov 7", "Great"),
            ],
          ),
        ],
      ),
    );
  }
//quick mood
  Widget _buildCheckinItem(String day, String mood) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: getMoodColor(mood),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              mood,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

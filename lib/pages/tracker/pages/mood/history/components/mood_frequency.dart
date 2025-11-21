import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../util/color_utils.dart';

class MoodFrequency extends StatelessWidget {
  const MoodFrequency({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, int> _moodFrequency = const {
      'Great': 12,
      'Good': 18,
      'Okay': 8,
      'Sad': 5,
      'Stressed': 7,
    };
    final total = _moodFrequency.values.reduce((a, b) => a + b);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mood Distribution",
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: _moodFrequency.entries.map((entry) {
              final percentage = (entry.value / total * 100).round();
              return _buildMoodDistributionRow(entry.key, entry.value, percentage);
            }).toList(),
          ),
        ],
      ),
    );
  }
  Widget _buildMoodDistributionRow(String mood, int count, int percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              mood,
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 20,
                  width: double.infinity * (percentage / 100),
                  decoration: BoxDecoration(
                    color: getMoodColor(mood),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 40,
            child: Text(
              "$percentage%",
              style: GoogleFonts.lato(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

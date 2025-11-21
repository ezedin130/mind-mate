import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsightsSection extends StatelessWidget {
  const InsightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F4F8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFB8E1EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.insights,
                color: const Color(0xFF1E4957),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                "Your Mood Insights",
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E4957),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildInsightItem(
            "📈 Positive Trend",
            "Your average mood has improved by 15% compared to last month",
          ),
          const SizedBox(height: 8),
          _buildInsightItem(
            "🌟 Best Day",
            "You're happiest on Saturdays - try to extend those positive vibes!",
          ),
          const SizedBox(height: 8),
          _buildInsightItem(
            "🔄 Pattern Found",
            "You tend to feel more stressed mid-week. Consider scheduling self-care on Wednesdays.",
          ),
          const SizedBox(height: 8),
          _buildInsightItem(
            "💪 Strength",
            "You maintain good consistency with 7-day check-in streak!",
          ),
        ],
      ),
    );
  }
  Widget _buildInsightItem(String title, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFB8E1EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E4957),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.lato(
              fontSize: 12,
              color: const Color(0xFF1E4957),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

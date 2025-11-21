import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/pages/tracker/pages/mood/history/components/monthly_trend.dart';
import 'package:mindmate/pages/tracker/pages/mood/history/components/summary_card.dart';
import 'components/insights_section.dart';
import 'components/mood_frequency.dart';
import 'components/weekly_chart.dart';

class MoodHistoryPage extends StatelessWidget {
  const MoodHistoryPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4957),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4957),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Mood Analytics",
          style: GoogleFonts.lato(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SummaryCard(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeeklyChart(),
                      const SizedBox(height: 24),
                      MonthlyTrends(),
                      const SizedBox(height: 24),
                      MoodFrequency(),
                      const SizedBox(height: 24),
                      InsightsSection(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../model/MoodData.dart';

class WeeklyChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // todo: Mock data - in real app, this would come from your database
    final List<MoodData> _weeklyMoodData = const [
      MoodData(day: 'Mon', mood: 'Good', score: 4),
      MoodData(day: 'Tue', mood: 'Great', score: 5),
      MoodData(day: 'Wed', mood: 'Okay', score: 3),
      MoodData(day: 'Thu', mood: 'Good', score: 4),
      MoodData(day: 'Fri', mood: 'Stressed', score: 2),
      MoodData(day: 'Sat', mood: 'Great', score: 5),
      MoodData(day: 'Sun', mood: 'Good', score: 4),
    ];
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
            "This Week's Mood",
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: GoogleFonts.lato(color: Colors.black54),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 5,
                labelStyle: GoogleFonts.lato(color: Colors.black54),
              ),
              series: <CartesianSeries<MoodData, String>>[
                LineSeries<MoodData, String>(
                  dataSource: _weeklyMoodData,
                  xValueMapper: (MoodData mood, _) => mood.day,
                  yValueMapper: (MoodData mood, _) => mood.score,
                  markerSettings: const MarkerSettings(isVisible: true),
                  color: const Color(0xFF1E4957),
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

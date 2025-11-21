import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../model/MonthlyTrend.dart';

class MonthlyTrends extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // todo: Mock data - in real app, this would come from your database
    final List<MonthlyTrend> _monthlyTrends = const [
      MonthlyTrend(month: 'Jan', average: 3.2),
      MonthlyTrend(month: 'Feb', average: 3.8),
      MonthlyTrend(month: 'Mar', average: 4.1),
      MonthlyTrend(month: 'Apr', average: 3.9),
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
            "Monthly Trends",
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: GoogleFonts.lato(color: Colors.black54),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 5,
                labelStyle: GoogleFonts.lato(color: Colors.black54),
              ),
              series: <CartesianSeries<MonthlyTrend, String>>[
                ColumnSeries<MonthlyTrend, String>(
                  dataSource: _monthlyTrends,
                  xValueMapper: (MonthlyTrend trend, _) => trend.month,
                  yValueMapper: (MonthlyTrend trend, _) => trend.average,
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
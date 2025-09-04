import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WatchlistPieChart extends StatelessWidget {
  const WatchlistPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 40,
        sectionsSpace: 2,
        sections: [
          PieChartSectionData(color: Colors.red, value: 40, title: '0%'),
          PieChartSectionData(color: Colors.orange, value: 30, title: '0%'),
          PieChartSectionData(color: Colors.blue, value: 15, title: '0%'),
          PieChartSectionData(color: Colors.purple, value: 15, title: '0%'),
        ],
      ),
    );
  }
}

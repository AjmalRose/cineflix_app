import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'watch_tracker.dart';

class WatchlistPieChart extends StatefulWidget {
  const WatchlistPieChart({
    super.key,
    required Null Function(dynamic counts, dynamic colors) onDataLoaded,
  });

  @override
  State<WatchlistPieChart> createState() => _WatchlistPieChartState();
}

class _WatchlistPieChartState extends State<WatchlistPieChart> {
  Map<String, int> genreCounts = {};

  final Map<String, Color> genreColors = {
    "Action": Colors.redAccent,
    "Drama": Colors.blueAccent,
    "Thriller": Colors.purpleAccent,
    "Crime": Colors.orangeAccent,
    "Romance": Colors.pinkAccent,
    "Sci-Fi": Colors.greenAccent,
    "Adventure": Colors.tealAccent,
    "Animation": Colors.amberAccent,
  };

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await WatchTracker.getGenreCounts();
    setState(() {
      genreCounts = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (genreCounts.isEmpty) {
      return Center(
        child: Text(
          "No watch stats yet.",
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    final total = genreCounts.values.fold<int>(0, (a, b) => a + b);

    return Column(
      children: [
        //Pie Chart
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 40,
              sectionsSpace: 2,
              sections: genreCounts.entries.map((entry) {
                final percentage = (entry.value / total) * 100;
                return PieChartSectionData(
                  color: genreColors[entry.key] ?? Colors.grey,
                  value: entry.value.toDouble(),
                  title: "${percentage.toStringAsFixed(1)}%",
                  titleStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: 16),

        // Legend Pie
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: genreCounts.entries.map((entry) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: genreColors[entry.key] ?? Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  "${entry.key} (${entry.value})",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

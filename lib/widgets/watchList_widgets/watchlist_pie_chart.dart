import 'package:cineflix_app/constants/colors_contants.dart';
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
    "Action": PieColor.action,
    "Drama": PieColor.drama,
    "Thriller": PieColor.thriller,
    "Crime": PieColor.crime,
    "Romance": PieColor.romance,
    "Sci-Fi": PieColor.scifi,
    "Adventure": PieColor.adventure,
    "Animation": PieColor.animation,
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
          style: TextStyle(color: ColorsConstants.ColorWhite),
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
                  color: genreColors[entry.key] ?? LoginColors.colorgrey,
                  value: entry.value.toDouble(),
                  title: "${percentage.toStringAsFixed(1)}%",
                  titleStyle: TextStyle(
                    color: ColorsConstants.ColorWhite,
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
                    color: genreColors[entry.key] ?? LoginColors.colorgrey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  "${entry.key} (${entry.value})",
                  style: TextStyle(color: ColorsConstants.ColorWhite),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class WatchlistLegend extends StatelessWidget {
  final Map<String, int> genreCounts;
  final Map<String, Color> genreColors;

  const WatchlistLegend({
    super.key,
    required this.genreCounts,
    required this.genreColors,
  });

  @override
  Widget build(BuildContext context) {
    if (genreCounts.isEmpty) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 16,
        runSpacing: 8,
        children: genreCounts.entries.map((entry) {
          final genre = entry.key;
          final count = entry.value;
          final color = genreColors[genre] ?? Colors.grey;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(width: 6),
              Text("$genre ($count)", style: TextStyle(color: Colors.white)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

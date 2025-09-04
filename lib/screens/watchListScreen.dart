import 'package:cineflix_app/widgets/watchList_widgets/watchlist_movie_card.dart';
import 'package:cineflix_app/widgets/watchList_widgets/watchlist_pie_chart.dart';
import 'package:cineflix_app/widgets/watchList_widgets/watchlist_stats_card.dart';
import 'package:flutter/material.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: Text("My Watchlist", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Track your viewing habits",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WatchlistStatsCard(
                  icon: Icons.access_time,
                  value: "0",
                  label: "Hours Watched",
                ),
                WatchlistStatsCard(
                  icon: Icons.trending_up,
                  value: "0",
                  label: "Movies Watched",
                ),
              ],
            ),
            SizedBox(height: 20),

            // Pie Chart
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Viewing Categories",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 200, child: WatchlistPieChart()),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Upcoming Releases
            Text(
              "Upcoming Releases",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 10),
            WatchlistMovieCard(
              title: "Dune:2",
              date: "March 15, 2024",
              genre: "Sci-Fi",
              image: "assets/images/Dune_Part_Two_poster.jpeg",
            ),
            WatchlistMovieCard(
              title: "Black Phone 2",
              date: "Oct 17, 2025",
              genre: "Thriller",
              image: "assets/images/Black_Phone_2_poster.jpg",
            ),
            WatchlistMovieCard(
              title: "Demon Slayer - The Movie: Infinity Castle",
              date: "Sep 12, 2025",
              genre: "Animation",
              image:
                  "assets/images/DSICDateAnnouncementKV2x3UK-1-Cropped-5bb23a9.png",
            ),
          ],
        ),
      ),
    );
  }
}

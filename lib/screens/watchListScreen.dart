import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/image_constants.dart';
import 'package:cineflix_app/widgets/watchList_widgets/watch_tracker.dart';
import 'package:cineflix_app/widgets/watchList_widgets/watchlist_movie_card.dart';
import 'package:cineflix_app/widgets/watchList_widgets/watchlist_pie_chart.dart';
import 'package:cineflix_app/widgets/watchList_widgets/watchlist_stats_card.dart';
import 'package:cineflix_app/widgets/watchList_widgets/watchList_legend.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  Map<String, int> genreCounts = {};
  Map<String, Color> genreColors = {};

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserData(); // reload per-user stats
  }

  Future<void> _loadUserData() async {
    final counts = await WatchTracker.getGenreCounts();
    setState(() {
      genreCounts = counts;
      genreColors = {
        "Action": PieColor.action,
        "Drama": PieColor.drama,
        "Thriller": PieColor.thriller,
        "Crime": PieColor.crime,
        "Romance": PieColor.romance,
        "Sci-Fi": PieColor.scifi,
        "Adventure": PieColor.adventure,
        "Animation": PieColor.animation,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalWatched = genreCounts.values.fold(0, (a, b) => a + b);

    return Scaffold(
      backgroundColor: ColorsConstants.ColorBlack,
      appBar: AppBar(
        backgroundColor: LoginColors.darkRed,
        title: Text(
          "My Watchlist",
          style: TextStyle(color: ColorsConstants.ColorWhite),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Track your viewing habits",
              style: TextStyle(color: LoginColors.colorgrey, fontSize: 16),
            ),
            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: ColorsConstants.ColorBlack,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Viewing Categories",
                    style: TextStyle(
                      color: ColorsConstants.ColorWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Pie chart
                  WatchlistPieChart(
                    onDataLoaded: (counts, colors) {
                      setState(() {
                        genreCounts = counts;
                        genreColors = colors;
                      });
                    },
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 120,
                          child: WatchlistStatsCard(
                            icon: Icons.trending_up,
                            value: totalWatched.toString(),
                            label: "Movies Watched",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  WatchlistLegend(
                    genreColors: genreColors,
                    genreCounts: genreCounts,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Text(
              "Upcoming Releases",
              style: TextStyle(
                color: ColorsConstants.ColorWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            WatchlistMovieCard(
              title: "Dune: Part Two",
              date: "March 15, 2024",
              genre: "Sci-Fi",
              image: AppImages.duneParttwo,
            ),
            WatchlistMovieCard(
              title: "Black Phone 2",
              date: "Oct 17, 2025",
              genre: "Thriller",
              image: AppImages.blackPhone2,
            ),
            WatchlistMovieCard(
              title: "Demon Slayer: Infinity Castle",
              date: "Sep 12, 2025",
              genre: "Animation",
              image: AppImages.demonSlayer,
            ),
          ],
        ),
      ),
    );
  }
}

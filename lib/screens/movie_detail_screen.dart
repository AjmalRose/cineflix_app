import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/image_constants.dart';
import 'package:cineflix_app/screens/movie_detail_screen.dart';
import 'package:cineflix_app/services/favouritePage_pref.dart';
import 'package:cineflix_app/services/shared_prefs.dart';
import 'package:cineflix_app/widgets/watchList_widgets/watch_tracker.dart';
import 'package:cineflix_app/services/current_user_notifier.dart';

class MovieDetailScreen extends StatefulWidget {
  final String image;
  final String title;
  final String year;
  final String genre;
  final double rating;
  final String description;
  final String duration;

  MovieDetailScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.year,
    required this.genre,
    required this.rating,
    required this.description,
    required this.duration,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _checkIfSaved();

    // React to user changes
    currentUserNotifier.addListener(_checkIfSaved);
  }

  @override
  void dispose() {
    currentUserNotifier.removeListener(_checkIfSaved);
    super.dispose();
  }

  Future<void> _checkIfSaved() async {
    final username =
        currentUserNotifier.value ?? await SharedPrefs.getUsername();
    if (username == null) return;

    final favs = await FavouriteService.getFavourites(username);
    final movieData =
        "${widget.title}|${widget.image}|${widget.year}|${widget.genre}|${widget.duration}";

    if (mounted) setState(() => isSaved = favs.contains(movieData));
  }

  Future<void> _toggleFavourite() async {
    final username =
        currentUserNotifier.value ?? await SharedPrefs.getUsername();
    if (username == null) return;

    final movieData =
        "${widget.title}|${widget.image}|${widget.year}|${widget.genre}|${widget.duration}";

    if (isSaved) {
      await FavouriteService.removeFavourite(username, movieData);
    } else {
      await FavouriteService.addFavourite(username, movieData);
    }

    if (mounted) setState(() => isSaved = !isSaved);
  }

  Future<void> _watchNow() async {
    final username =
        currentUserNotifier.value ?? await SharedPrefs.getUsername();
    if (username == null) return;

    final movieData =
        "${widget.title}|${widget.image}|${widget.year}|${widget.genre}|${widget.duration}";

    // Save movie to favourites/watchlist
    await FavouriteService.addFavourite(username, movieData);

    // Update genre stats for pie chart
    await WatchTracker.addGenre(widget.genre);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${widget.title} added to Watchlist 🎬")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.ColorBlack,
      body: Stack(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => Container(color: Colors.grey[900]),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 380),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${widget.year} • ${widget.genre} • ⭐ ${widget.rating} • ${widget.duration}",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: _toggleFavourite,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: isSaved
                            ? LoginColors.greenColor
                            : Colors.redAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        isSaved ? "Saved ✅" : "Save to Favourite",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _watchNow,
                          icon: Icon(Icons.play_arrow),
                          label: Text("Watch Now"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: _toggleFavourite,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: ColorsConstants.ColorWhite.withOpacity(0.12),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(isSaved ? "Saved" : "Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

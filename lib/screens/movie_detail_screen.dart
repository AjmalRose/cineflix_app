import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';

class MovieDetailScreen extends StatefulWidget {
  final String image;
  final String title;
  final String year;
  final String genre;
  final double rating;
  final String description;
  final String duration; // new required property

  const MovieDetailScreen({
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
                  // <-- rating + duration here
                  Text(
                    "${widget.year} • ${widget.genre} • ⭐ ${widget.rating} • ${widget.duration}",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => setState(() => isSaved = !isSaved),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: isSaved ? Colors.green : Colors.redAccent,
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
                          onPressed: () {
                            // TODO: open player / playback
                          },
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
                        onPressed: () => setState(() => isSaved = !isSaved),
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
